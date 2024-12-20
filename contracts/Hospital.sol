// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Hospital {
    string name;
    address wallet;
    string[] reports;
    string[] appointments;
    string[] doctors;
    string[] patients;
}