// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CarbonFootprint{
    struct Company{
        uint32 id;
        string OrgName;
        uint32 vehicles;
        uint32 avgdistance;
        uint32 vehicleweigth;
        uint32 cargoweight;
    }
    enum VehicleType {LCV, HCV}
    VehicleType choice;
    uint16 CLCV = 143;
    uint16 CHCV = 307;
    Company[] private companies;

    function cfpcalculator(uint32 vehicle_weigth, uint32 cargo_weight, uint32 avg_distance, uint32 no_of_vehicles) external view returns(uint256){
        uint256 total_weigth = vehicle_weigth + cargo_weight;
        uint256 tonkm = total_weigth * avg_distance * no_of_vehicles;

        uint256 cfpvalues;
        if (choice == VehicleType.LCV)
        {
            cfpvalues = CLCV * tonkm;
            return cfpvalues / 1000000;
        }
        else{
            cfpvalues = CHCV * tonkm;
            return cfpvalues / 1000000;
        }
    }
}
