// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Hospital.sol";

contract HospitalContract{
    mapping(address => Hospital) public hospitals;

    function createHospital(string memory _name) public {
        require(bytes(_name).length > 0, "Name is required");
        Hospital memory newHospital = Hospital(_name, msg.sender, new string[](0), new string[](0), new string[](0), new string[](0));
        hospitals[msg.sender] = newHospital;
    }

    function addDoctor(address _hospital, string memory _doctor) public {
        require(bytes(_doctor).length > 0, "Doctor name is required");
        Hospital storage hospital = hospitals[_hospital];
        hospital.doctors.push(_doctor);
    }

    function addPatient(address _hospital, string memory _patient) public {
        require(bytes(_patient).length > 0, "Patient name is required");
        Hospital storage hospital = hospitals[_hospital];
        hospital.patients.push(_patient);
    }

    function addAppointment(address _hospital, string memory _appointment) public {
        require(bytes(_appointment).length > 0, "Appointment is required");
        Hospital storage hospital = hospitals[_hospital];
        hospital.appointments.push(_appointment);
    }

    function addReport(address _hospital, string memory _report) public {
        require(bytes(_report).length > 0, "Report is required");
        Hospital storage hospital = hospitals[_hospital];
        hospital.reports.push(_report);
    }

    function getHospital() public view returns (string memory, address, string[] memory, string[] memory, string[] memory, string[] memory) {
        return (hospitals[msg.sender].name, hospitals[msg.sender].wallet, hospitals[msg.sender].reports, hospitals[msg.sender].appointments, hospitals[msg.sender].doctors, hospitals[msg.sender].patients);
    }

    function getHospitalByAddress(address _hospital) public view returns (string memory, address, string[] memory, string[] memory, string[] memory, string[] memory) {
        return (hospitals[_hospital].name, hospitals[_hospital].wallet, hospitals[_hospital].reports, hospitals[_hospital].appointments, hospitals[_hospital].doctors, hospitals[_hospital].patients);
    }

    function getHospitals() public view returns (address[] memory) {
        address[] memory addresses = new address[](1);
        addresses[0] = msg.sender;
        return addresses;
    }
}