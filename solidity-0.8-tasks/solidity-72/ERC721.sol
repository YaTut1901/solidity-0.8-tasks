// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface IERC721 is IERC165 {
    error ERC721NotExistingTokenId(uint256 tokenId);
    error ERC721NotAuthorized(address addr);
    error ERC721InvalidAddress(address addr);
    error ERC721UnsafeRecipient(address recipient);

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    function balanceOf(address owner) external view returns (uint256 balance);

    function ownerOf(uint256 tokenId) external view returns (address owner);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function approve(address to, uint256 tokenId) external;

    function setApprovalForAll(address operator, bool approved) external;

    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);
}

interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenID,
        bytes calldata data
    ) external returns (bytes4);
}

contract ERC721 is IERC721 {
    mapping(uint256 => address) internal _ownerOf;
    mapping(address => uint256) internal _balanceOf;
    mapping(uint256 => address) internal _approvals;
    mapping(address => mapping(address => bool)) public isApprovedForAll;

    modifier exists(uint256 _tokenId) {
        if (_ownerOf[_tokenId] == address(0)) {
            revert ERC721NotExistingTokenId(_tokenId);
        }
        _;
    }

    modifier valid(address _addr) {
        if (_addr == address(0)) {
            revert ERC721InvalidAddress(_addr);
        }
        _;
    }

    modifier ownerOrApprovedForAll(address _owner, address _requester) {
        if (_requester != _owner && !isApprovedForAll[_owner][_requester]) {
            revert ERC721NotAuthorized(_requester);
        }
        _;
    }

    modifier ownerOrApproved(
        address _owner,
        address _requester,
        uint256 tokenId
    ) {
        if (
            _requester != _owner &&
            !isApprovedForAll[_owner][_requester] &&
            _approvals[tokenId] != _requester
        ) {
            revert ERC721NotAuthorized(_requester);
        }
        _;
    }

    modifier safeERC721Recipient(
        address _operator,
        address _from,
        address _to,
        uint256 _tokenId,
        bytes memory _data
    ) {
        if (
            _to.code.length != 0 &&
            IERC721Receiver(_to).onERC721Received(
                _operator,
                _from,
                _tokenId,
                _data
            ) !=
            IERC721Receiver.onERC721Received.selector
        ) {
            revert ERC721UnsafeRecipient(_to);
        }
        _;
    }

    function supportsInterface(bytes4 interfaceId)
        external
        pure
        returns (bool)
    {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }

    function balanceOf(address owner)
        external
        view
        valid(owner)
        returns (uint256 balance)
    {
        return _balanceOf[owner];
    }

    function ownerOf(uint256 tokenId)
        external
        view
        exists(tokenId)
        returns (address owner)
    {
        return _ownerOf[tokenId];
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    )
        external
        exists(tokenId)
        valid(to)
        safeERC721Recipient(msg.sender, from, to, tokenId, data)
    {
        transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    )
        external
        exists(tokenId)
        valid(to)
        safeERC721Recipient(msg.sender, from, to, tokenId, "")
    {
        transferFrom(from, to, tokenId);
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    )
        public
        valid(to)
        exists(tokenId)
        ownerOrApproved(from, msg.sender, tokenId)
    {
        _balanceOf[from]--;
        _balanceOf[to]++;
        _ownerOf[tokenId] = to;

        delete _approvals[tokenId];

        emit Transfer(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId)
        external
        exists(tokenId)
        valid(to)
        ownerOrApprovedForAll(_ownerOf[tokenId], msg.sender)
    {
        _approvals[tokenId] = to;
        emit Approval(_ownerOf[tokenId], to, tokenId);
        return;
    }

    function setApprovalForAll(address operator, bool approved)
        external
        valid(operator)
    {
        isApprovedForAll[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    function getApproved(uint256 tokenId)
        external
        view
        exists(tokenId)
        returns (address operator)
    {
        return _approvals[tokenId];
    }
}
