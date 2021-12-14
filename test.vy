# @version ^0.3.1
'''greet: public(String[100])

@external
def __init__():
	self.greet = "Hello World"
'''

#truck_weight: public(uint256)
#cargo_weight: public(uint256)
total_weight: public(uint256)
tonkm: public(uint256)
cfpvalues: public(uint256)
LCV: public(string)
truck_weight: public(uint256)
cargo_weight: public(uint256)
avg_distance: public(uint256)
no_of_vehicles: public(uint256)
choice = "LCV"
CLCV = 143
CHCV = 307
@external
def __init__(truck_weight: uint256, cargo_weight: uint256, avg_distance: uint256, no_of_vehicles: uint256):
  self.total_weight = truck_weight + cargo_weight
	self.tonkm = total_weight * avg_distance * no_of_vehicles
	if (choice == LCV):
		cfpvalues = CLCV * tonkm
		return cfpvalues
	else:
		cfpvalues = CHCV * tonkm
		return cfpvalues
