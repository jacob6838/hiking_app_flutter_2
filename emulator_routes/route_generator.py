import datetime
from math import ceil
import random

MILES_PER_DEGREE = 69
MOVEMENT_RATE = 3  # mph
TRIP_LENGTH_MILES = 0.25  # miles
UPDATE_RATE = 5  # seconds
SECONDS_PER_HOUR = 3600
NUMBER_INTERATIONS = ceil(
    (TRIP_LENGTH_MILES / MOVEMENT_RATE) * SECONDS_PER_HOUR / UPDATE_RATE)
DISTANCE_STEP_DEGREES = TRIP_LENGTH_MILES / \
    NUMBER_INTERATIONS / MILES_PER_DEGREE
COORDINATE_KEY = "**COORDINATES**"

ISO_8601_FORMAT_STRING = "%Y-%m-%dT%H:%M:%SZ"
TEMPLATE_ROW = '<trkpt lat="{lat}" lon="{long}"><ele>{elev}</ele><time>{time}</time></trkpt>'

turnIndex = NUMBER_INTERATIONS / 2

startTimestamp = datetime.datetime.now()

currLat = 40.061839
currLong = -105.206797
currElev = 1588

coordinates = []

for i in range(NUMBER_INTERATIONS):
    currTimestamp = startTimestamp + \
        datetime.timedelta(seconds=i*UPDATE_RATE)
    if (i <= turnIndex):
        currLat += DISTANCE_STEP_DEGREES
        # currLong += DISTANCE_STEP_DEGREES
        # currElev +=
    else:
        # currLat += DISTANCE_STEP_DEGREES
        currLong += DISTANCE_STEP_DEGREES
        # currElev +=
    randomizedLat = currLat + (random.random() * 2 - 1) * 0.0002
    randomizedLong = currLong + (random.random() * 2 - 1) * 0.0002
    coordinates.append([datetime.datetime.strftime(
        currTimestamp, ISO_8601_FORMAT_STRING), randomizedLat, randomizedLong, currElev])

with open('template.gpx') as template:
    with open('route_1.gpx', 'w+') as outFile:
        for line in template.readlines():
            if COORDINATE_KEY not in line:
                outFile.write(line)
                continue
            for row in coordinates:
                outFile.write(TEMPLATE_ROW.format(
                    lat=row[1], long=row[2], elev=row[3], time=row[0]) + '\n')
