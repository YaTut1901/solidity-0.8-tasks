// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Parent {
    uint256 private priv; // accessible ONLY inside the same contract
    uint256 public pub; // accessible from inside this contract, it`s children and externally (compiler will generate external getter function)
    uint256 internal inter; // accessible from this contract and it`s childrens

    function privF() private view returns(uint256) { // function will be accessible ONLY inside this contract
        return priv;
    }

    function pubF() public virtual view returns(uint256) { // function will be accessible from inside this contract, it`s children and externally
        return pub;
    }

    function intF() internal virtual view returns(uint256) { // function will be accessible from inside this contract and it`s children
        return inter;
    }

    function ext() external virtual pure returns(uint256) { // function accessible only externally
        return 200;
    }
}

contract Child is Parent {
    // uint256 privCh = priv; // priv variable is not visible
    uint256 pubCh = pub; 
    uint256 interCh = inter;

    function privF() private override  view returns(uint256) { 
        return super.privF(); // function privF is not visible
    }

    function pubF() public override view returns(uint256) { 
        return super.pubF();
    }

    function intF() internal override view returns(uint256) { 
        return super.intF();
    }

    function ext() external override pure returns(uint256) {
        return super.ext();
    }
}