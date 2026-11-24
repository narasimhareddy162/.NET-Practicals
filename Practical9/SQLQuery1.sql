ALTER TABLE Students
DROP COLUMN IsPlaced;

DELETE FROM Students
WHERE PlacementId = 4;

select * from students;