class Thermostat:
    """Mock Thermostat with temperature readings.
    """

    def __init__(self, min: float = 15.0, max: float = 30.0, step: float = 0.5) -> None:
        self.MIN = min
        self.MAX = max
        self.STEP = step

        self.temp = self.MIN

    def read(self) -> float:
        """Mock temperature reading. Increases by STEP at each reading.

        :return float: the new temperature
        """
        self.temp = self.MIN if self.temp == self.MAX else self.temp + self.STEP
        return self.temp
