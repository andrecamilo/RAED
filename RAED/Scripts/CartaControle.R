clima

FA <- clima$DryBulbFarenheit
CE <- clima$DryBulbCelsius
AI <- clima$AirportID
RH <- clima$RelativeHumidity

plot(FA, RH)
hist(RH)
