// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

struct Patient {
    string name;
    string dob;
    address wallet;
    string[] reports;
}