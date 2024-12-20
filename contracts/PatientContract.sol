// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Patient.sol";

contract PatientContract{
    mapping(address => Patient) public patients;

    function createPatient(string memory _name, string memory _dob) public {
        require(bytes(_name).length > 0, "Name is required");
        require(bytes(_dob).length > 0, "Date of birth is required");
        Patient memory newPatient = Patient(_name, _dob, msg.sender, new string[](0));
        patients[msg.sender] = newPatient;
    }

    function addReport(string memory _report) public {
        require(bytes(_report).length > 0, "Report is required");
        Patient storage patient = patients[msg.sender];
        patient.reports.push(_report);
    }

    function getPatient() public view returns (string memory, string memory, address, string[] memory) {
        return (patients[msg.sender].name, patients[msg.sender].dob, patients[msg.sender].wallet, patients[msg.sender].reports);
    }
}
