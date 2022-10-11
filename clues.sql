-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been
-- traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed,
-- so find the least populated country in Southern Europe, and we'll start looking for her there.
 
-- Write SQL query here
-- Look in the region within the country schema and order the population --
SELECT * FROM country 
WHERE region='Southern Europe' 
ORDER BY population ASC;
--ORDER BY ASC because we want to go from the lowest to highest in order to find the--
--country with the lowest population.--

-- We see here that the Vatican City (VAT) has the lowest population in Southern Europe. We want to take the--
-- three digit code as it is the only key that is within the other tables --

-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in
-- this country's officially recognized language. Check our databases and find out what language is
-- spoken in this country, so we can call in a translator to work with you.

-- Write SQL query here
-- Access the countrylanguage schema and match the country code (VAT)--
SELECT * FROM countrylanguage 
WHERE countrycode='VAT';

--We are returned a result of 'Italian' the official language of the Vatican City--


-- Clue #3: We have new news on the classes Carmen attended – our gumshoes tell us she's moved on
-- to a different country, a country where people speak only the language she was learning. Find out which
-- nearby country speaks nothing but that language.

-- Write SQL query here
--We access the countrylanguage schema to match which country speaks only Italian.--
SELECT * FROM countrylanguage 
WHERE language='Italian' 
ORDER BY percentage DESC;
--ORDER BY DESC because we are trying to order the percentage from highest to lowest to find highest percentage.--
-- We see a country with a code of 'SMR' matches the 100% description.--

-- Clue #4: We're booking the first flight out – maybe we've actually got a chance to catch her this time.
-- There are only two cities she could be flying to in the country. One is named the same as the country – that
-- would be too obvious. We're following our gut on this one; find out what other city in that country she might
-- be flying to.

-- Write SQL query here
--We want to find the cities within the country SMR, but is not the same name as the country.--
--We will access the city schema and match any cities with the countrycode SMR.--
SELECT name FROM country 
WHERE code='SMR'; --To get the country name. San Marino--
SELECT * FROM city --To get the city names.--
WHERE countrycode='SMR';

--We get two cities, Serravalle and San Marino. We know it cant be San Marino.--

-- Clue #5: Oh no, she pulled a switch – there are two cities with very similar names, but in totally different
-- parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were
-- headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

-- Write SQL query here
--We now have to find a city that has a similar name to Serravalle and get the name of the --
--country that city is located. We will return the countries code (3).--
SELECT * FROM city 
WHERE name like 'Serr%';
--The most closeley related city is 'Serra'. The three digit code we get is 'BRA'. I wonder what country this is. We will--
--now find the country with the matching code (3).--
SELECT * FROM country 
WHERE code='BRA';
--The code 'BRA' matches with the country Brzil.--


-- Clue #6: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards
-- the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll
-- follow right behind you!

-- Write SQL query here
--We now want to get the capital of the country, which is given in an integer.--
--Brazil's capital is 211. We want to match the capital city of the country.--
--The only integer in the city value that is an integer is the id
SELECT * FROM city 
WHERE id='211';
--We get returned Brazil's capital of Brasilia.--


-- Clue #7: She knows we're on to her – her taxi dropped her off at the international airport, and she beat us to
-- the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the
-- landing dock. Lucky for us, she's getting cocky. She left us a note (below), and I'm sure she thinks she's very clever, but
-- if we can crack it, we can finally put her where she belongs – behind bars.


--               Our playdate of late has been unusually fun –
--               As an agent, I'll say, you've been a joy to outrun.
--               And while the food here is great, and the people – so nice!
--               I need a little more sunshine with my slice of life.
--               So I'm off to add one to the population I find
--               In a city of ninety-one thousand and now, eighty five.

-- So Carmen is leaving town and she is trying to escape to a city wher the population is--
--91085 once she moves there. Therefore the population is 91084 for the city we are--
--looking for.--
-- We're counting on you, gumshoe. Find out where she's headed, send us the info, and we'll be sure to meet her at the gates with bells on.
--We will access the city schema and find the city with population 91084.--
SELECT * FROM city 
WHERE population=91084;

--The city with population 91084 is lovely Santa Monica, California. Carmen --
--Is trying to get to the dock of Santa Monica.--