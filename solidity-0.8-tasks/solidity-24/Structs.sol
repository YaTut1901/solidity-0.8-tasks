// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Structs {
    struct Car {
        string model;
        uint256 price;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car) carsByOwners;

    constructor() {
        car = Car("Tesla", 12323, msg.sender);
        cars.push(car);
        carsByOwners[msg.sender] = car;
    }

    function foo() external {
        // struct initialization, 3 ways
        Car memory _car = Car("Tesla", 12323, msg.sender);
        Car memory __car = Car({model: "Tesla", owner: msg.sender, price: 12323});
        Car memory ___car;
        car.model = "Tesla";
        car.owner = msg.sender;
        car.price = 12323;

        // struct get and update
        Car memory car1 = cars[0]; // variable copied from blockchain to local memory, no changes will be stored
        Car storage car2 = cars[1]; // variable is taken directly from blockchain, all changes will be stored after function complete
        car2.price = 3234235;

        // struct delete
        delete car2.model; // car2 will be stored on blockchain with default value in model field
        delete cars[0]; // cars[0] will be removed from array, cars[0] become struct with default value in all fields: struct Car { model: ""; price: 0; owner: address[0]; }
    }
}