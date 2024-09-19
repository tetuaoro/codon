-- init.sql
CREATE TABLE samples (
	id SERIAL PRIMARY KEY,
	sample_type VARCHAR(100),
	analyst VARCHAR(100)
);
INSERT INTO samples (sample_type, analyst) VALUES ('sample_type1', 'Analyst One'), ('sample_type1', 'Analyst Two'), ('sample_type2', 'Analyst Three'), ('sample_type2', 'Analyst Four');



-- PEOPLE --

-- people_status = 'Active', 'OnLeave', 'Left'
CREATE TABLE people (
	id SERIAL PRIMARY KEY,
	employee_id TEXT UNIQUE,
	status TEXT NOT NULL,
	first_name TEXT,
	last_name TEXT,
	preferred_name TEXT NOT NULL,
	email TEXT UNIQUE NOT NULL,
	phone_number TEXT,
	department TEXT,
	role TEXT,
	hire_date TIMESTAMPTZ,
	emergency_contact TEXT,
	certifications TEXT,
	specializations TEXT,
	picture TEXT,
	bio TEXT,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO people (employee_id, first_name, last_name, preferred_name, email, phone_number, bio, department, role, hire_date, status, emergency_contact, certifications, specializations, picture) VALUES
('BIO10-0001', 'Gene', 'Splicer', 'Gene Splicer', 'gene.splicer@biolab.com', '555-0100', 'Always on the cutting edge.', 'Genetics', 'Senior Scientist', '2020-01-15', 'Active', 'Dr. Helix (555-1111)', 'PhD in Genetics', 'DNA recombination', 'gene_splicer.png'),
('BIO10-0002', 'Elle', 'Ment', 'Elle Ment', 'elle.ment@biolab.com', '555-0101', 'Her experiments always have great chemistry.', 'Chemistry', 'Lab Assistant', '2021-06-01', 'Active', 'Sam Ment (555-2222)', 'BSc in Chemistry', 'Chemical analysis', 'elle_ment.png'),
('BIO10-0003', 'Adam', 'Zyme', 'Adam Zyme', 'adam.zyme@biolab.com', '555-0102', 'Enzymes are his catalyst.', 'Biochemistry', 'Research Scientist', '2019-09-10', 'Left', 'Eve Zyme (555-3333)', 'PhD in Biochemistry', 'Enzymology', 'adam_zyme.png'),
('BIO10-0004', 'Ann', 'Tibody', 'Ann Tibody', 'ann.tibody@biolab.com', '555-0103', 'Her work is highly defensive.', 'Immunology', 'Lab Technician', '2018-05-20', 'OnLeave', 'Ian Tibody (555-4444)', 'BSc in Biology', 'Antibody production', 'ann_tibody.png'),
('BIO10-0005', 'Phil', 'Ter', 'Phil Ter', 'phil.ter@biolab.com', '555-0104', 'Filtering out the impurities.', 'Microbiology', 'Lab Assistant', '2022-02-14', 'Active', 'Sue Ter (555-5555)', 'BSc in Microbiology', 'Filtration techniques', 'phil_ter.png'),
('BIO10-0006', 'Ben', 'Doyle', 'Ben Doyle', 'ben.doyle@biolab.com', '555-0105', 'Digging deep into research.', 'Geology', 'Research Scientist', '2017-11-01', 'Left', 'Maggie Doyle (555-6666)', 'PhD in Geology', 'Soil analysis', 'ben_doyle.png'),
('BIO10-0007', 'Ari', 'Ous', 'Ari Ous', 'ari.ous@biolab.com', '555-0106', 'Her ideas are contagious.', 'Virology', 'Senior Scientist', '2016-07-30', 'Active', 'Val Ous (555-7777)', 'PhD in Virology', 'Virus research', 'ari_ous.png'),
('BIO10-0008', 'Polly', 'Merase', 'Polly Merase', 'polly.merase@biolab.com', '555-0107', 'She never stops copying.', 'Molecular Biology', 'Lab Technician', '2021-03-12', 'OnLeave', 'Ruth Merase (555-8888)', 'BSc in Molecular Biology', 'PCR techniques', 'polly_merase.png'),
('BIO10-0009', 'Dee', 'N.A.', 'Dee N.A.', 'dee.na@biolab.com', '555-0108', 'At the core of every discovery.', 'Genomics', 'Research Scientist', '2018-08-24', 'Left', 'Jay N.A. (555-9999)', 'PhD in Genomics', 'Genome sequencing', 'dee_na.png'),
('BIO10-0010', 'Helix', 'Turner', 'Helix Turner', 'helix.turner@biolab.com', '555-0109', 'Twists and turns in his research.', 'Structural Biology', 'Lab Assistant', '2020-12-05', 'Left', 'Felix Turner (555-1010)', 'BSc in Structural Biology', 'Protein folding', 'helix_turner.png'),
('BIO10-0011', 'Max', 'A Million', 'Max A Million', 'max.a.million@biolab.com', '555-0110', 'Always reaching for the maximum.', 'Data Analysis', 'Data Scientist', '2019-04-01', 'Left', 'Mina Million (555-1111)', 'MSc in Data Science', 'Big data analytics', 'max_a_million.png'),
('BIO10-0012', 'Eve', 'Olution', 'Eve Olution', 'eve.olution@biolab.com', '555-0111', 'Constantly adapting.', 'Evolutionary Biology', 'Senior Scientist', '2015-10-10', 'Active', 'Adam Olution (555-1212)', 'PhD in Evolutionary Biology', 'Species adaptation', 'eve_olution.png'),
('BIO10-0013', 'Michael', 'Shipley', 'Mic Shipley', 'mic@biolab.com', '555-25372', 'Calm but busy', 'Operations', 'Research Operations', '2011-01-12', 'Active', 'Briar (555-836417)', 'PhD in Patience', 'Species of Dune', 'mic.png'),
('BIO10-0014', 'Dominik', 'Wilkowski', 'Dom', 'dom.wilko@biolab.com', '555-666', 'Total nerd.', 'Computer science', 'Senior Dork', '2023-12-24', 'Active', 'Belle (555-11101)', 'Dropout', 'Compiling things', NULL);



-- EQUIPMENT --

-- equipment_type = 'Flask', 'Vessel', 'IncubationCabinet'
-- status = 'Working', 'NeedsCleaning', 'Preparation', 'Sterilization', 'Broken', 'OutOfCommission'
CREATE TABLE equipment (
	id SERIAL PRIMARY KEY,
	equipment_type TEXT NOT NULL,
	qrcode TEXT UNIQUE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	name TEXT NOT NULL,
	status TEXT NOT NULL,
	manufacturer TEXT,
	purchase_date TIMESTAMPTZ,
	vendor TEXT,
	cost_in_cent INT,
	warranty_expiration_date TIMESTAMPTZ,
	location TEXT,
	notes TEXT
);
INSERT INTO equipment (equipment_type, qrcode, create_date, name, status, manufacturer, purchase_date, vendor, cost_in_cent, warranty_expiration_date, location, notes) VALUES
('Flask','qr_00001_F.svg','2022-09-18T12:45:59.324310806Z','Stevens Flask','Working','Flasktastic Labs','2022-09-19T12:45:59.324310806Z','SupplySidekick',50000,'2025-01-15T12:45:59.324310806Z','Back Row D, Column 27','This one is a working horse!'),
('Vessel','qr_00002_V.svg','2024-08-15T12:45:59.324310806Z','Britta','NeedsCleaning','VesselForge','2022-06-10T12:45:59.324310806Z','ScienceStash',75000,'2024-06-10T12:45:59.324310806Z','In the cafeterias fridge','Has a crack on the top left'),
('Flask','qr_00003_F.svg','2023-01-12T12:45:59.324310806Z','Flasky McFlaskface','Sterilization','BeakerMakers','2022-12-01T12:45:59.324310806Z','LabGear Galore',62050,'2026-01-12T12:45:59.324310806Z','Top Shelf, Aisle 5','Always keeps it clean!'),
('Vessel','qr_00004_V.svg','2023-05-20T12:45:59.324310806Z','Vessela','Broken','VesselMakers Inc.','2021-07-15T12:45:59.324310806Z','SupplySidekick',82000,'2023-11-20T12:45:59.324310806Z','Storage Room B, Shelf 3','Handle with care... or not.'),
('IncubationCabinet','qr_00005_I.svg','2022-11-05T12:45:59.324310806Z','Microbe Motel','NeedsCleaning','Germination Station Inc.','2022-10-25T12:45:59.324310806Z','ScienceStash',58099,'2025-10-05T12:45:59.324310806Z','Chemical Lab, Table 4','Whips up a storm in experiments!'),
('Vessel','qr_00006_V.svg','2024-03-30T12:45:59.324310806Z','Vesselina','OutOfCommission','VesselVentures','2023-04-18T12:45:59.324310806Z','LabGear Galore',99000,'2024-03-30T12:45:59.324310806Z','Main Lab, Counter 12','All sailed out.'),
('IncubationCabinet','qr_00007_I.svg','2024-02-10T12:45:59.324310806Z','Microbe Mansion','Working','Hot Box Industries','2023-11-11T12:45:59.324310806Z','SupplySidekick',73000,'2027-02-10T12:45:59.324310806Z','Mixology Lab, Station 8','Holds mixes like a pro!'),
('IncubationCabinet','qr_00008_I.svg','2023-07-22T12:45:59.324310806Z','Captain Contain','Preparation','Containment Creations','2022-08-02T12:45:59.324310806Z','ScienceStash',67000,'2026-07-22T12:45:59.324310806Z','Secure Storage, Area 3','A true captain of containment.'),
('Flask','qr_00009_F.svg','2023-09-09T12:45:59.324310806Z','Dr. Flaskenstein','Working','Mad Flask Labs','2023-05-19T12:45:59.324310806Z','LabGear Galore',52069,'2025-09-09T12:45:59.324310806Z','Experiment Zone, Bay 2','Brings experiments to life!'),
('Vessel','qr_00010_V.svg','2024-04-15T12:45:59.324310806Z','Vesselocity','Sterilization','Vessel Velocity Inc.','2023-07-01T12:45:59.324310806Z','SupplySidekick',84500,'2026-04-15T12:45:59.324310806Z','High-Speed Lab, Corner 9','Speedy and sleek, always on the go!'),
('Flask','qr_00011_F.svg','2024-01-18T12:45:59.324310806Z','Flask-in-a-Box','Working','Boxed Labs','2022-12-15T12:45:59.324310806Z','ScienceStash',54000,'2027-01-18T12:45:59.324310806Z','Storage Unit 12, Shelf 4','Comes with a twist!'),
('IncubationCabinet','qr_00012_I.svg','2023-10-25T12:45:59.324310806Z','Spore Spa','NeedsCleaning','WonderCabinets','2022-03-11T12:45:59.324310806Z','LabGear Galore',91010,'2024-10-25T12:45:59.324310806Z','Mystery Lab, Area 7','A cabinet full of surprises!');

CREATE TABLE equipment_notes (
	id SERIAL PRIMARY KEY,
	equipment INT NOT NULL REFERENCES equipment(id) ON DELETE CASCADE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	person INT NOT NULL REFERENCES people(id),
	notes TEXT NOT NULL,
	media1 TEXT,
	media2 TEXT,
	media3 TEXT,
	media4 TEXT,
	media5 TEXT,
	media6 TEXT,
	media7 TEXT,
	media8 TEXT,
	media9 TEXT,
	media10 TEXT
);
CREATE INDEX equipment_notes_equipment ON equipment_notes (equipment);
CREATE INDEX equipment_notes_person ON equipment_notes (person);
INSERT INTO equipment_notes (equipment, person, notes) VALUES
(1, 2, E'The thing still refuses to make coffee.'),
(1, 3, E'Found a sandwich from 2019 inside the item.'),
(1, 1, E'Do not press the red button unless you enjoy alarms.'),
(1, 2, E'Equipment refuses to operate until it gets a motivational speech.'),
(3, 4, E'Dust levels exceeded recommended safe limits—again.'),
(3, 2, E'Do not challenge the machine to a staring contest—you will lose.'),
(3, 5, E'The humming sound is normal. The screaming is not.'),
(4, 1, E'If this equipment asks for a raise, politely decline.'),
(4, 3, E'All systems nominal, except for the blinking light of mystery.'),
(4, 4, E'Removed what seemed to be a nest of paperclips.'),
(6, 2, E'Machine insists it\'s not broken, just differently functional.'),
(6, 5, E'The machine may or may not grant wishes when turned off and on again.'),
(6, 1, E'Managed to remove the sticker saying "Kick Me".'),
(7, 3, E'Do not taunt the equipment. It seems to understand sarcasm.'),
(7, 2, E'Found no issues except a mild attitude problem.'),
(7, 2, E'Equipment demands to be addressed as "Your Highness."'),
(7, 4, E'Machine is now 90% less sticky.'),
(8, 5, E'Confirmed the equipment does not appreciate knock-knock jokes.'),
(8, 2, E'It believes we sholuld use the Imperial system. Expect slow performance.'),
(8, 1, E'If the equipment starts glowing, evacuate the building.'),
(8, 1, E'Do not feed the equipment after midnight. You know the rules.'),
(9, 3, E'The self-destruct sequence is NOT a feature to be tested.'),
(9, 4, E'Found extra parts lying around, but everything seems to work.'),
(9, 5, E'Removed evidence of late-night snack sessions.'),
(10, 1, E'The machine is in denial about it\'s age.'),
(10, 2, E'If the equipment starts smoking, its not on fire—its just stressed.'),
(10, 3, E'It responds well to compliments.'),
(11, 4, E'The equipment seems to be communicating in Morse code via blinking lights.'),
(11, 5, E'Discovered the source of the beeping—it was just hungry.'),
(11, 1, E'Polished to a shine; can now see your reflection. Need a shave!'),
(12, 2, E'Machine believes it\'s a toaster.\nIt is not a toaster.'),
(12, 3, E'Do not attempt to fix the machine with a hammer.\n\nAgain.'),
(12, 4, E'Removed traces of glitter bomb.\nThe prank war continues.'),
(12, 5, E'If found speaking to the equipment, please consult HR. Again'),
(12, 5, E'Do not mention obsolescence; it\'s a sensitive topic.');

-- action_type = 'cleaning', 'sterilization', 'preparation', 'edit'
CREATE TABLE equipment_actions (
	id SERIAL PRIMARY KEY,
	action_type TEXT NOT NULL,
	equipment INT NOT NULL REFERENCES equipment(id) ON DELETE CASCADE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	person INT NOT NULL REFERENCES people(id),
	notes TEXT,
	field TEXT,
	old_value TEXT,
	new_value TEXT
);
CREATE INDEX equipment_actions_equipment ON equipment_actions (equipment);
CREATE INDEX equipment_actions_person ON equipment_actions (person);
INSERT INTO equipment_actions (action_type, equipment, person, notes, field, old_value, new_value) VALUES
('cleaning', 1, 3, E'Found a tiny civilization of dust bunnies; negotiations are ongoing.', NULL, NULL, NULL),
('edit', 1, 5, E'Status changed to "Sentient"; it passed the Turing test.', 'status', 'working', 'broken'),
('edit', 2, 8, E'Moved to the "Noisy Equipment" section; it wouldnt stop humming.', 'location', 'Under desk', 'Shelve 12, Cell 12, Row E'),
('edit', 2, 2, E'Updated manual to include "Do not feed after midnight."', 'notes', NULL, 'No heat for this one'),
('sterilization', 3, 6, E'Sterilized after it started growing it\'s own cultures.', NULL, NULL, NULL),
('cleaning', 3, 9, E'Removed mysterious sticky substance; taste test inconclusive.', NULL, NULL, NULL),
('edit', 4, 1, E'Status changed to "Possessed"; it started making eerie sounds.', 'status', 'NeedsCleaning', 'OutOfComission'),
('edit', 4, 14, E'Edited settings to disable the "Self-Destruct" feature.', 'notes', 'TODO', NULL),
('preparation', 5, 7, E'Prepared for the annual "Equipment Talent Show".', NULL, NULL, NULL),
('sterilization', 5, 12, E'Sterilized after it didnt want to join the bacteria union.', NULL, NULL, NULL),
('edit', 6, 4, E'Moved to storage; it needs some "alone time".', 'location', 'Shelf Top Floor', 'Basement'),
('cleaning', 7, 11, E'Cleaned the "Error 404: Cleanliness Not Found".', NULL, NULL, NULL),
('edit', 7, 2, E'Status changed to "Mysteriously Wet"; source of moisture unknown.', 'status', 'NeedsCleaning', 'Working'),
('edit', 7, 13, E'Updated firmware to version 1.21 Flask.', 'notes', 'Reminder: to clean this', NULL),
('preparation', 8, 5, E'Prepared for interdimensional travel; safety not guaranteed.', NULL, NULL, NULL),
('sterilization', 9, 10, E'Sterilized after an incident with a radioactive burrito.', NULL, NULL, NULL),
('edit', 9, 3, E'Adjusted settings to "Do Not Disturb"; it\'s meditating.', 'status', 'Working', 'NeedsCleaning'),
('edit', 10, 6, E'Relocated to Lab 42; because it\'s the answer to everything.', 'location', 'Shelf 41', 'Shelf 42'),
('edit', 11, 8, E'Status changed to "Invisible"; cant find it anywhere.', 'location', 'nowhere', 'Shelf 7'),
('cleaning', 11, 1, E'Attempted to clean; ended up in a philosophical debate.', NULL, NULL, NULL),
('edit', 12, 14, E'Edited user manual to include "Beware of the Leopard".', 'notes', 'Contains Leopard', 'Contains Leptospira'),
('preparation', 12, 7, E'Prepared for upgrade; hoping it doesnt gain self-awareness.', NULL, NULL, NULL),
('cleaning', 12, 9, E'Cleaned glitter residue; who had a party without inviting me?', NULL, NULL, NULL),
('sterilization', 12, 2, E'Flask sterilized, so clean that even the microbes are afraid to enter!', NULL, NULL, NULL);



-- CULTURE

-- culture_contamination_status = 'Clean', 'Xenic', 'Monoxenic', 'Axenic', 'Contaminated', 'ParentContaminated', 'CleanWasContaminated'
CREATE TABLE culture (
	id SERIAL PRIMARY KEY,
	qrcode TEXT NOT NULL UNIQUE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_DATE,
	create_by INT REFERENCES people(id),
	name TEXT NOT NULL,
	parent INT NOT NULL REFERENCES culture(id),
	culture_method TEXT,
	species TEXT,
	genus TEXT,
	location TEXT,
	storage_conditions TEXT,
	equipment INT REFERENCES equipment(id),
	growth_medium TEXT,
	contamination_status TEXT,
	notes TEXT
);
