#1
4-Way Traffic Signal Controller

## Problem Statement

- A traffic light is to be installed at the intersection of **four roads**.
- The directions are assumed to be **East, West, North, and South**.
- **Only one direction of traffic is allowed to move at a time**.
- **Red, Yellow, and Green** signals are used to control traffic in each direction.

---

## 4-Way Traffic Signal Controller Design

- Each traffic light is set to **Green for 30 seconds**.
- After the green phase, the light is set to **Yellow for 5 seconds**.
- The same process is **repeated for all other directions**.
- During this time, **all other directions remain Red** to ensure safety.

---

## Notes

- The controller operates sequentially for each direction.
- The design ensures **no conflicting green signals**.
- This system can be implemented using a **finite state machine (FSM)** approach in Verilog.

#2
Highway-country road Traffic Signal Controller – Specification

## Specification

- As soon as there are no cars on the country road, the country road traffic signal turns yellow and then red, and the traffic signal on the main highway turns green again.

- There is a sensor to detect cars waiting on the country road. The sensor sends a signal **X** as input to the controller.
  - **X = 1** if there are cars on the country road  
  - **X = 0** if there are no cars on the country road

- There are delays on transitions from **S1 to S2**, from **S2 to S3**, and from **S4 to S0**.  
  These delays must be controllable.

- The traffic signal for the **main highway gets the highest priority** because cars are continuously present on the main highway.  
  Thus, the main highway signal remains **green by default**.

- Occasionally, cars from the **country road** arrive at the traffic signal.  
  The traffic signal for the country road must turn **green only long enough** to let the cars on the country road go.

