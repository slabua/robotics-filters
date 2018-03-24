# robotics-filters
[![License: GPLv3][GPLimg]][GPLurl]

Copyright (C) 2013  
Salvatore La Bua [slabua(at)gmail.com](mailto:slabua@gmail.com)  
MTM  
GLB  

DICGIM - University of Palermo  

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Introduction to the Project](#introduction-to-the-project)
- [Filters](#filters)
  - [KalmanF01 (Linear Kalman Filter)](#kalmanf01-linear-kalman-filter)
  - [KalmanF02 (Extended Kalman Filter)](#kalmanf02-extended-kalman-filter)
  - [KalmanF03 (Extended Kalman Filter)](#kalmanf03-extended-kalman-filter)
  - [ParticleF04](#particlef04)
  - [EKFSLAM05](#ekfslam05)
- [LICENSE](#license)
- [Screenshots](#screenshots)
  - [KalmanF01](#kalmanf01)
  - [KalmanF02](#kalmanf02)
  - [KalmanF03](#kalmanf03)
  - [ParticleF04](#particlef04-1)
  - [EKFSLAM05](#ekfslam05-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
## Introduction to the Project

Kalman, Particle and SLAM Filters implemented for the 2012/2013 Robotics course.

## Filters

### KalmanF01 (Linear Kalman Filter)
The 2D robot (x, y) follows a linear path using the distance to a wall to localise itself.

### KalmanF02 (Extended Kalman Filter)
  The 2D robot (x, y) follows a linear path using the distance to a landmark to localise itself.

### KalmanF03 (Extended Kalman Filter)
  The 3D robot (x, y, θ) follows a linear path using the distance to a wall to localise itself.

### ParticleF04
  The 3D robot (x, y, θ) follows a linear path using the distance to the closest landmark to localise itself.

### EKFSLAM05
The 3D robot (x, y, θ) follows a path defined by a series of waypoints using the distance to the landmarks to localise itself and internally build a map of the environment.

## LICENSE

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Screenshots

### KalmanF01
![KalmanF01][S01]

### KalmanF02
![KalmanF02][S02]

### KalmanF03
![KalmanF03][S03]

### ParticleF04
![ParticleF04][S04]

### EKFSLAM05
![EKFSLAM05][S05]

[GPLimg]: https://img.shields.io/badge/License-GPLv3-blue.svg
[GPLurl]: https://www.gnu.org/licenses/gpl-3.0
[S01]: https://goo.gl/mpN1rH
[S02]: https://goo.gl/NNciBb
[S03]: https://goo.gl/BbF4zo
[S04]: https://goo.gl/MSDfxo
[S05]: https://goo.gl/p8htFK

