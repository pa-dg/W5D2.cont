# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      gdp >
      (
        SELECT
          gdp
        FROM
          countries
        WHERE
          gdp IS NOT NULL AND continent = 'Europe'
        ORDER BY 
          gdp DESC
        LIMIT
          1
      ); 
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      continent, name, area
    FROM
      countries, (
          SELECT
            continent as continent2, MAX(area) as max_area
          FROM
            countries
          GROUP BY
            continent
        ) as max_area_table
    WHERE
      countries.continent  = max_area_table.continent2 AND countries.area = max_area_table.max_area;
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SQL
end
