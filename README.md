# LaneDepartureDetectionMBSD

This project models a bad driver on a curvy road and the vehicle's efforts to correct lane departures.

The curve of the road follows a Matlab calculation for a worst-case-scenario highway curvature at 70 miles per hour.

![image](https://github.com/user-attachments/assets/fd1b7c17-006e-45c8-a53e-6534bff23677)

The lane departure assist is controlled by a Stateflow model.

![image](https://github.com/user-attachments/assets/ef01fe74-fde1-4f34-b242-bc38fac0ce7a)

The controller's reponse has been balanced and tuned with a PID controller to return the driver to the lane as quickly as possible without suffering extreme lateral acceleration that could destabilize the vehicle.

![image](https://github.com/user-attachments/assets/c50a131c-ef45-4230-aafa-02a12b4a7405)

The vehicle's roll on its springs has been added as a rudimentary Simscape model to show how the vehicle rocks back and forth during the lane departure correction events.

![image](https://github.com/user-attachments/assets/0c1f2cd6-50a0-4f53-862b-2f5895421163)

This entire system is contained in a Simulink model to connect all aspects to model its behavior in various situations.

Highway's Path Generator:
![image](https://github.com/user-attachments/assets/2102e29d-eace-45a9-95e9-1cf70786f716)


![image](https://github.com/user-attachments/assets/fe4997e5-07eb-4604-9230-85bc73dd67cd)

![image](https://github.com/user-attachments/assets/b00aa80a-88b4-4bb9-9330-96a849b601bf)

![image](https://github.com/user-attachments/assets/97fed0a6-89ec-4524-a00a-61d1c4313bd8)

![image](https://github.com/user-attachments/assets/cd543342-24fd-4317-8a68-d917342af489)

![image](https://github.com/user-attachments/assets/60ab419f-ef4b-4b6c-a77a-73b39d7d3c1c)



