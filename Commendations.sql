CREATE TABLE `commendations` (`Title` INT(50) NOT NULL , `Description` INT(250) NOT NULL , `Requirements` INT(500) NOT NULL , `Faction` INT(50) NOT NULL , PRIMARY KEY (`Title`));

INSERT INTO `commendations` 
	(`Title`, `Description`, `Requirements`, `Faction`) 
VALUES 
	('Hoarder of Lost Artefacts', 'Sell 450 Treasure Artefacts to the Gold Hoarders.', 
	'Grade I: 5 Artefacts. Grade II: 30 Artefacts. Grade III: 90 Artefacts. Grade IV: 225 Artefacts. Grade V: 450 Artefacts', 
	'The Gold Hoarders'), 
	('Hoarder of the Captain\'s Gold', 'Sell 360 Captain\'s Chests to the Gold Hoarders.', 
	'Grade I: 20 Chests. Grade II: 60 Chests. Grade III: 120 Chests. Grade IV: 240 Chests. Grade V: 360 Chests', 
	'The Gold Hoarders'), 
	('Keeper of a Glittering Hoard', 'Earn 150,000 gold with Gold Hoarder Voyages.', 
	'Grade I: 1,000 gold. Grade II: 5,000 gold. Grade III: 15,000 gold. Grade IV: 75,000 gold. Grade V: 150,000 gold', 
	'The Gold Hoarders'), 
	('Sailor of the Gold Horizon', 'Sail 1,000 nautical miles on Gold Hoarder Voyages.', 
	'Grade I: 10 miles. Grade II: 75 miles. Grade III: 200 miles. Grade IV: 500 miles. Grade V: 1,000 miles', 
	'The Gold Hoarders'), 
	('Seeker of Lost Maps', 'Purchase 250 Gold Hoarder Voyages.', 
	'Grade I: 5 voyages. Grade II: 25 voyages. Grade III: 50 voyages. Grade IV: 100 voyages. Grade V: 250 voyages', 
	'The Gold Hoarders');

INSERT INTO `commendations` 
	(`Title`, `Description`, `Requirements`, `Faction`) 
VALUES 
	('Voyager of Lost Souls', 'Complete 250 Order of Souls Voyages.', 
	'Grade I: 5 voyages. Grade II: 25 voyages. Grade III: 50 voyages. 
	Grade IV: 100 voyages. Grade V: 250 voyages', 'The Order of Souls'), 
	('Mercenary of the Ancient Order', 'Earn 150,000 gold with the Order of Souls Voyages.', 
	'Grade I: 1,000 gold. Grade II: 5,000 gold. Grade III: 15,000 gold. Grade IV: 75,000 gold. 
	Grade V: 150,000 gold', 'The Order of Souls'), 
	('Hunter of Cursed Crews', 'Defeat 180 Skeleton Crews.', 
	'Grade I: 2 Crews. Grade II: 10 Crews. Grade III: 35 Crews. Grade IV: 90 Crews. Grade V: 180 Crews', 
	'The Order of Souls'), 
	('Hunter of Cursed Captains', 'Defeat 1000 Skeleton Captains.', 
	'Grade I: 20 Captains. Grade II: 70 Captains. Grade III: 200 Captains. Grade IV: 450 Captains. Grade V: 1,000 Captains', 
	'The Order of Souls'), 
	('Raider of Cursed Strongholds', 'Clear 120 Skeleton Forts.', 
	'Grade I: 1 Forts. Grade II: 10 Forts. Grade III: 25 Forts. Grade IV: 60 Forts. Grade V: 120 Forts', 
	'The Order of Souls');