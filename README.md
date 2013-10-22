robotics-filters
================

Salvatore La Bua (slabua@gmail.com)  
GLB  
MTM  

DICGIM - University of Palermo

---

Kalman, Particle and SLAM Filters implemented for the 2012/2013 Robotics course.

**Filters:**

* KalmanF01 (Linear Kalman Filter)  
  The 2D robot (x, y) follows a linear path using the distance to a wall to localise itself.
  
* KalmanF02 (Extended Kalman Filter)  
  The 2D robot (x, y) follows a linear path using the distance to a landmark to localise itself.
  
* KalmanF03 (Extended Kalman Filter)  
  The 3D robot (x, y, θ) follows a linear path using the distance to a wall to localise itself.
  
* ParticleF04  
  The 3D robot (x, y, θ) follows a linear path using the distance to the closest landmark to localise itself.
  
* EKFSLAM05  
  The 3D robot (x, y, θ) follows a path defined by a series of waypoints using the distance to the landmarks to localise itself and internally build a map of the environment.  
