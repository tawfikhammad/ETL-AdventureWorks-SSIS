select TerritoryID, Name, country_name, [Group]
from sales.SalesTerritory st join Sales.CountryName cn
on st.CountryRegionCode = cn.country_code