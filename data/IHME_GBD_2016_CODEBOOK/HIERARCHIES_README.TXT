The cause hierarchy file, REI (risk factor, etiology, and impairment) hierarchy file, and location hierarchy file contain GBD 2016 reporting hierarchies.

To view each hierarchy in its nested order (e.g. for locations, a country would appear on the list beneath the region it belongs to), sort by the sort_order column.


Definitions:

locations_id:
Locations IDs for geographic variables in this dataset come from an IHME database that creates and stores unique numeric identifiers for locations of various location types.

parent_id
This indicates the location ID for the location's parent in the hierarchy. For example, all 31 Mexican states and 1 federal district have a parent ID of 130, the location ID for the country of Mexico.

level
Indicates a location value's level in a location hierarchy. 

sort_order
Used to sort a set of location values in a particular order - not alphabetical.

subnational_location:
This is a binary variable to indicate whether a location is subnational region. 0 = No; 1 = Yes.

cause_id
Cause IDs for cause variables in this dataset come from an IHME database that creates and stores unique numeric identifiers for each GBD cause.

cause_outline
This outline represents the hierarchy of causes and the depth of each cause in the hierarchy by alpha-numeric code for the current round of GBD.

rei_id
REI IDs for risk, etiology, and impairment variables in this dataset come from an IHME database that creates and stores unique numeric identifiers for each risk, etiology, and impairment.




 

