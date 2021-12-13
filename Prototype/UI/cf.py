#!/usr/bin/env python
# coding: utf-8

# In[ ]:


from flask import Flask, request, render_template, redirect, url_for, flash


# In[ ]:


print(vyper.__version__)


# In[ ]:


app = Flask(__name__, template_folder="template")

@app.route('/',methods=['POST','GET'])
def static_page():
    return render_template('index.html')

@app.route("/calculateTotalWeight", methods=['POST','GET'])
def calculateTotalWeight():    
    global vehicleWeight, cargoWeight, totalWeight
    vehicleWeight = request.form['vehicleWeight']
    cargoWeight = request.form['cargoWeight']
    #totalWeight = ''
    if vehicleWeight == '' or vehicleWeight=='Please enter vehicle weight first!':
        vehicleWeight = 'Please enter weight!'
    elif cargoWeight == '' or cargoWeight=='Please enter cargo weight first!':
        cargoWeight = 'Please enter cargo weight first!'
    else:
        totalWeight = int(cargoWeight) + int(vehicleWeight)
        print(cargoWeight,vehicleWeight, totalWeight)
        return totalWeight
    return render_template('index.html', cargoWeight=cargoWeight, vehicleWeight=vehicleWeight, totalWeight=totalWeight)

@app.route("/contract", methods=['POST','GET'])
def contract():
    global vehcicleType, numberOfVehicle, avgDistance, totalWeight
    vehicleType = request.form['vehicleType']
    numberOfVehicle = request.form['numberOfVehicle']
    avgDistance = request.form['avgDistance']
    totalWeight = calculateTotalWeight()
    if vehicleType == 'lcv':
        totalEmission = 0.1431*totalWeight*avgDistance
        return totalEmission
    elif vehicleType == 'hcv':
        totalEmission = 0.307*totalWeight*avgDistance
        return totalEmission
    return render_template('index.html', vehicleType=vehicleType, numberOfVehicle=numberOfVehicle, totalWeight=totalWeight, avgDistance=avgDistance, totalEmission= totalEmission)

if __name__=='__main__':
    app.run()


# In[ ]:




