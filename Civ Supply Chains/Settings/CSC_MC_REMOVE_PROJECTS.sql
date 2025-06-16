-- CSC_MC_REMOVE_PROJECTS_AND_PRODUCTS
-- Author: Henno
-- DateCreated: 2025-06-15 20:20:17
--------------------------------------------------------------

DELETE FROM Projects
WHERE ProjectType LIKE 'PROJECT_CREATE_CORPORATION_PRODUCT_%';