# @version ^0.3.1

truck_weight: public(uint256)
cargo_weight: public(uint256)
total_weight: public(uint256)
tonkm: public(uint256)
avg_distance: public(uint256)
no_of_vehicles: public(uint256)
cfpvalues: public(uint256)

LCV: public(string)

choice = "LCV"
CLCV = 143
CHCV = 307
@external
def __init__(truck: uint256, cargo: uint256, dist: uint256, vehicles: uint256):
    self.truck_weight = truck_weight
    self.cargo_weight = cargo
    self.total_weight = truck + cargo
    self.avg_distance = dist
    self.no_of_vehicles = vehicles
    self.tonkm = self.total_weight * dist * vehicles

@external
def CarbonFootprint(type: string):
    if (type == LCV):
		self.cfpvalues = CLCV * self.tonkm
		return self.cfpvalues
    else:
		self.cfpvalues = CHCV * self.tonkm
		return self.cfpvalues
