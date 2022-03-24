BEGIN 
--SELECT Location, date, total_cases, new_cases, total_deaths, population
--FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
--ORDER BY 1, 2;

SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases) *100 AS DeathPercentage
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
WHERE Location like '%States%'
ORDER BY 1, 2;

SELECT Location, date, total_cases, population, (total_cases/population) *100 AS PercentInfection
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
WHERE Location like '%States%'
ORDER BY 1, 2;

SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/ Population)) *100 AS PercentPopulationInfection
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
#WHERE Location like '%States%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfection desc;

SELECT Location, MAX(cast(Total_deaths as int)) AS TotalDeathCount 
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
#WHERE Location like '%States%'
WHERE continent is not null
GROUP BY Location
ORDER BY TotalDeathCount desc;

--LETS break It down to continent basis
SELECT continent, MAX(cast(Total_deaths as int)) AS TotalDeathCount 
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
#WHERE Location like '%States%'
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc;


SELECT date, SUM(new_cases) AS TotalNewCases, SUM(cast(new_deaths as int)) AS TotalNewDeaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 AS DeathPercentage
FROM portfolioproject-340415.Covid19Dataset.CovidDeaths
WHERE continent is not null 
GROUP BY date
ORDER by 1,2; 
END;