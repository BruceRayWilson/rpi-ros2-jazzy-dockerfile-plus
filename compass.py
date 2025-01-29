# SPDX-FileCopyrightText: 2021 ladyada for Adafruit Industries
# SPDX-License-Identifier: MIT

""" Display compass heading data five times per second """
import time
from math import atan2, degrees
import math
import board
import adafruit_lsm303dlh_mag

i2c = board.I2C()  # uses board.SCL and board.SDA
# i2c = board.STEMMA_I2C()  # For using the built-in STEMMA QT connector on a microcontroller
sensor = adafruit_lsm303dlh_mag.LSM303DLH_Mag(i2c)


def vector_2_degrees(x, y):
    angle = degrees(atan2(y, x))
    if angle < 0:
        angle += 360
    return angle


def get_heading(_sensor):
    magnet_x, magnet_y, magnet_z = _sensor.magnetic
    return vector_2_degrees(magnet_x, magnet_z)

def calculate_heading(x, y, declination=0):
    # Calculate heading in radians
    heading_rad = math.atan2(y, x)
    # Convert to degrees
    heading_deg = math.degrees(heading_rad)
    # Normalize to 0-360 degrees
    heading_deg = (heading_deg + 360) % 360
    # Adjust for declination
    heading_deg += declination
    # Normalize again after declination adjustment
    heading_deg = (heading_deg + 360) % 360
    return heading_deg

while True:
    magnet_x, magnet_y, magnet_z = sensor.magnetic
    magnet_x = round(magnet_x, 2)
    magnet_y = round(magnet_y, 2)
    magnet_z = round(magnet_z, 2)

    #print(f"{magnet_x}, {magnet_y}, {magnet_z}")
    print("heading: {:.2f} degrees".format(get_heading(sensor)))
    time.sleep(0.1)
