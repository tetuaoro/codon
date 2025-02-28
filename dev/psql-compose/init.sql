-- init.sql
CREATE TABLE samples (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	sample_type VARCHAR(100),
	analyst VARCHAR(100)
);
INSERT INTO samples (sample_type, analyst) VALUES ('sample_type1', 'Analyst One'), ('sample_type1', 'Analyst Two'), ('sample_type2', 'Analyst Three'), ('sample_type2', 'Analyst Four');



-- PEOPLE --

-- people_status = 'Active', 'OnLeave', 'Left'
CREATE TABLE people (
	id                   INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username             TEXT NOT NULL UNIQUE,
	password             TEXT NOT NULL,
	employee_id          TEXT UNIQUE,
	status               TEXT NOT NULL,
	first_name           TEXT,
	last_name            TEXT,
	preferred_name       TEXT NOT NULL,
	email                TEXT UNIQUE NOT NULL,
	phone_number         TEXT,
	department           TEXT,
	role                 TEXT,
	hire_date            TIMESTAMPTZ,
	emergency_contact    TEXT,
	certifications       TEXT,
	specializations      TEXT,
	picture              TEXT,
	bio                  TEXT,
	permission_equipment TEXT NOT NULL,
	permission_people    TEXT NOT NULL,
	create_date          TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL
);
INSERT INTO people (username, password, employee_id, first_name, last_name, preferred_name, email, phone_number, bio, department, role, hire_date, status, emergency_contact, certifications, specializations, picture, permission_equipment, permission_people) VALUES
('gene81', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0001', 'Gene', 'Splicer', 'Gene Splicer', 'gene.splicer@biolab.com', '555-0100', 'Always on the cutting edge.', 'Genetics', 'Senior Scientist', '2020-01-15', 'Active', 'Dr. Helix (555-1111)', 'PhD in Genetics', 'DNA recombination', 'gene_splicer.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[1])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('mentelle', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0002', 'Elle', 'Ment', 'Elle Ment', 'elle.ment@biolab.com', '555-0101', 'Her experiments always have great chemistry.', 'Chemistry', 'Lab Assistant', '2021-06-01', 'Active', 'Sam Ment (555-2222)', 'BSc in Chemistry', 'Chemical analysis', 'elle_ment.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[2])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('adam_zyme', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0003', 'Adam', 'Zyme', 'Adam Zyme', 'adam.zyme@biolab.com', '555-0102', 'Enzymes are his catalyst.', 'Biochemistry', 'Research Scientist', '2019-09-10', 'Left', 'Eve Zyme (555-3333)', 'PhD in Biochemistry', 'Enzymology', 'adam_zyme.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[3])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('ano666', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0004', 'Ann', 'Tibody', 'Ann Tibody', 'ann.tibody@biolab.com', '555-0103', 'Her work is highly defensive.', 'Immunology', 'Lab Technician', '2018-05-20', 'OnLeave', 'Ian Tibody (555-4444)', 'BSc in Biology', 'Antibody production', 'ann_tibody.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[4])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('filter', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0005', 'Phil', 'Ter', 'Phil Ter', 'phil.ter@biolab.com', '555-0104', 'Filtering out the impurities.', 'Microbiology', 'Lab Assistant', '2022-02-14', 'Active', 'Sue Ter (555-5555)', 'BSc in Microbiology', 'Filtration techniques', 'phil_ter.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[5])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('ben42', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0006', 'Ben', 'Doyle', 'Ben Doyle', 'ben.doyle@biolab.com', '555-0105', 'Digging deep into research.', 'Geology', 'Research Scientist', '2017-11-01', 'Left', 'Maggie Doyle (555-6666)', 'PhD in Geology', 'Soil analysis', 'ben_doyle.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[6])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('arious2', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0007', 'Ari', 'Ous', 'Ari Ous', 'ari.ous@biolab.com', '555-0106', 'Her ideas are contagious.', 'Virology', 'Senior Scientist', '2016-07-30', 'Active', 'Val Ous (555-7777)', 'PhD in Virology', 'Virus research', 'ari_ous.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[7])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('polly', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0008', 'Polly', 'Merase', 'Polly Merase', 'polly.merase@biolab.com', '555-0107', 'She never stops copying.', 'Molecular Biology', 'Lab Technician', '2021-03-12', 'OnLeave', 'Ruth Merase (555-8888)', 'BSc in Molecular Biology', 'PCR techniques', 'polly_merase.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[8])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('dna', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0009', 'Dee', 'N.A.', 'Dee N.A.', 'dee.na@biolab.com', '555-0108', 'At the core of every discovery.', 'Genomics', 'Research Scientist', '2018-08-24', 'Left', 'Jay N.A. (555-9999)', 'PhD in Genomics', 'Genome sequencing', 'dee_na.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[9])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('hturner', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0010', 'Helix', 'Turner', 'Helix Turner', 'helix.turner@biolab.com', '555-0109', 'Twists and turns in his research.', 'Structural Biology', 'Lab Assistant', '2020-12-05', 'Left', 'Felix Turner (555-1010)', 'BSc in Structural Biology', 'Protein folding', 'helix_turner.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[10])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('max1000', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0011', 'Max', 'A Million', 'Max A Million', 'max.a.million@biolab.com', '555-0110', 'Always reaching for the maximum.', 'Data Analysis', 'Data Scientist', '2019-04-01', 'Left', 'Mina Million (555-1111)', 'MSc in Data Science', 'Big data analytics', 'max_a_million.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[11])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('eve', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0012', 'Eve', 'Olution', 'Eve Olution', 'eve.olution@biolab.com', '555-0111', 'Constantly adapting.', 'Evolutionary Biology', 'Senior Scientist', '2015-10-10', 'Active', 'Adam Olution (555-1212)', 'PhD in Evolutionary Biology', 'Species adaptation', 'eve_olution.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[12])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('mic', '$argon2id$v=19$m=19456,t=2,p=1$T9GO2wvNWMGcMQ/uPdH8lQ$EjVtyckTRnjly15GvDW3RAo2GvZPT/Dv7prpRDv6YcI', 'BIO10-0013', 'Michael', 'Shipley', 'Mic Shipley', 'mic@biolab.com', '555-25372', 'Calm but busy', 'Operations', 'Research Operations', '2011-01-12', 'Active', 'Briar (555-836417)', 'PhD in Patience', 'Species of Dune', 'mic.png', 'READ(*)|WRITE(*)|CREATE(true)', 'READ(equipment[-1],person[13])|WRITE(equipment[-1],person[1])|CREATE(true)'),
('dom', '$argon2id$v=19$m=19456,t=2,p=1$jGpHvsSseOmqYpSjYmHsDw$C/tnsXIf8dEdGojiKDcYis3e7gniaT40jvqIyFzri4c', 'BIO10-0014', 'Dominik', 'Wilkowski', 'Dom', 'dom.wilko@biolab.com', '555-666', 'Total nerd.', 'Computer science', 'Senior Dork', '2023-12-24', 'Active', 'Belle (555-11101)', 'Dropout', 'Compiling things', NULL, 'READ(equipment[12],equipment[5],equipment[1],equipment[3],person[14])|WRITE(equipment[12],person[14])|CREATE(false)', 'READ(*)|WRITE(*)|CREATE(true)');



-- EQUIPMENT --

-- equipment_type = 'Flask', 'Vessel', 'IncubationCabinet'
-- status = 'Cleaned', 'Prepared', 'Sterilized', 'InUse', 'Dirty', 'Archived'
CREATE TABLE equipment (
	id                       INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	equipment_type           TEXT NOT NULL,
	qrcode                   TEXT UNIQUE,
	person                   INT NOT NULL REFERENCES people(id),
	create_date              TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	name                     TEXT NOT NULL,
	status                   TEXT NOT NULL,
	manufacturer             TEXT,
	purchase_date            TIMESTAMPTZ,
	vendor                   TEXT,
	cost_in_cent             INT,
	warranty_expiration_date TIMESTAMPTZ,
	location                 TEXT,
	notes                    TEXT
);
INSERT INTO equipment (equipment_type, qrcode, person, create_date, name, status, manufacturer, purchase_date, vendor, cost_in_cent, warranty_expiration_date, location, notes) VALUES
('Flask', '/upload_media/equipment/0-5k/1/qr_1.svg', '1', '2022-09-18T12:45:59.324310806Z', 'Stevens Flask', 'Cleaned', 'Flasktastic Labs', '2022-09-19T12:45:59.324310806Z', 'SupplySidekick',50000,'2025-01-15T12:45:59.324310806Z', 'Back Row D, Column 27', 'This one is a working horse!'),
('Vessel', '/upload_media/equipment/0-5k/2/qr_2.svg', '2', '2024-08-15T12:45:59.324310806Z', 'Britta', 'Dirty', 'VesselForge', '2022-06-10T12:45:59.324310806Z', 'ScienceStash',75000,'2024-06-10T12:45:59.324310806Z', 'In the cafeterias fridge', 'Has a crack on the top left'),
('Flask', '/upload_media/equipment/0-5k/3/qr_3.svg', '3', '2023-01-12T12:45:59.324310806Z', 'Flasky McFlaskface', 'Sterilized', 'BeakerMakers', '2022-12-01T12:45:59.324310806Z', 'LabGear Galore',62050,'2026-01-12T12:45:59.324310806Z', 'Top Shelf, Aisle 5', 'Always keeps it clean!'),
('Vessel', '/upload_media/equipment/0-5k/4/qr_4.svg', '4', '2023-05-20T12:45:59.324310806Z', 'Vessela', 'Archived', 'VesselMakers Inc.', '2021-07-15T12:45:59.324310806Z', 'SupplySidekick',82000,'2023-11-20T12:45:59.324310806Z', 'Storage Room B, Shelf 3', 'Handle with care... or not.'),
('IncubationCabinet', '/upload_media/equipment/0-5k/5/qr_5.svg', '5', '2022-11-05T12:45:59.324310806Z', 'Microbe Motel', 'Dirty', 'Germination Station Inc.', '2022-10-25T12:45:59.324310806Z', 'ScienceStash',58099,'2025-10-05T12:45:59.324310806Z', 'Chemical Lab, Table 4', 'Whips up a storm in experiments!'),
('Vessel', '/upload_media/equipment/0-5k/6/qr_6.svg', '6', '2024-03-30T12:45:59.324310806Z', 'Vesselina', 'Archived', 'VesselVentures', '2023-04-18T12:45:59.324310806Z', 'LabGear Galore',99000,'2024-03-30T12:45:59.324310806Z', 'Main Lab, Counter 12', 'All sailed out.'),
('IncubationCabinet', '/upload_media/equipment/0-5k/7/qr_7.svg', '7', '2024-02-10T12:45:59.324310806Z', 'Microbe Mansion', 'Cleaned', 'Hot Box Industries', '2023-11-11T12:45:59.324310806Z', 'SupplySidekick',73000,'2027-02-10T12:45:59.324310806Z', 'Mixology Lab, Station 8', 'Holds mixes like a pro!'),
('IncubationCabinet', '/upload_media/equipment/0-5k/8/qr_8.svg', '8', '2023-07-22T12:45:59.324310806Z', 'Captain Contain', 'Prepared', 'Containment Creations', '2022-08-02T12:45:59.324310806Z', 'ScienceStash',67000,'2026-07-22T12:45:59.324310806Z', 'Secure Storage, Area 3', 'A true captain of containment.'),
('Flask', '/upload_media/equipment/0-5k/9/qr_9.svg', '14', '2023-09-09T12:45:59.324310806Z', 'Dr. Flaskenstein', 'InUse', 'Mad Flask Labs', '2023-05-19T12:45:59.324310806Z', 'LabGear Galore',52069,'2025-09-09T12:45:59.324310806Z', 'Experiment Zone, Bay 2', 'Brings experiments to life!'),
('Vessel', '/upload_media/equipment/0-5k/10/qr_10.svg', '10', '2024-04-15T12:45:59.324310806Z', 'Vesselocity', 'Sterilized', 'Vessel Velocity Inc.', '2023-07-01T12:45:59.324310806Z', 'SupplySidekick',84500,'2026-04-15T12:45:59.324310806Z', 'High-Speed Lab, Corner 9', 'Speedy and sleek, always on the go!'),
('Flask', '/upload_media/equipment/0-5k/11/qr_11.svg', '11', '2024-01-18T12:45:59.324310806Z', 'Flask-in-a-Box', 'InUse', 'Boxed Labs', '2022-12-15T12:45:59.324310806Z', 'ScienceStash',54000,'2027-01-18T12:45:59.324310806Z', 'Storage Unit 12, Shelf 4', 'Comes with a twist!'),
('IncubationCabinet', '/upload_media/equipment/0-5k/12/qr_12.svg', '12', '2023-10-25T12:45:59.324310806Z', 'Spore Spa', 'Prepared', 'WonderCabinets', '2022-03-11T12:45:59.324310806Z', 'LabGear Galore',91010,'2024-10-25T12:45:59.324310806Z', 'Mystery Lab, Area 7',E'Welcome to the "Spore Spa"—where fungi come to relax, rejuvenate, and sporulate! 🧖‍♂️🍄\nBrought to you by WonderCabinets, this state-of-the-art incubation cabinet is the pinnacle of fungal luxury.\nOur team of intrepid scientists and researchers are on a mission to mold a better future by discovering sustainable solutions that are good for the planet.\n\nSo sit back, relax, and let the spores do the work—because saving the world shouldn\'t be a mushroom for error!');


CREATE TABLE equipment_notes (
	id          INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	equipment   INT NOT NULL REFERENCES equipment(id) ON DELETE CASCADE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	person      INT NOT NULL REFERENCES people(id),
	notes       TEXT NOT NULL,
	media1      TEXT,
	media2      TEXT,
	media3      TEXT,
	media4      TEXT,
	media5      TEXT,
	media6      TEXT,
	media7      TEXT,
	media8      TEXT,
	media9      TEXT,
	media10     TEXT
);
CREATE INDEX equipment_notes_equipment ON equipment_notes (equipment);
CREATE INDEX equipment_notes_person ON equipment_notes (person);
INSERT INTO equipment_notes (equipment, person, notes, media1, media2, media3, media4, media5, media6, media7, media8, media9, media10) VALUES
(1, 2, E'The thing still refuses to make coffee.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 3, E'Found a sandwich from 2019 inside the item.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 1, E'Do not press the red button unless you enjoy alarms.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1, 2, E'Equipment refuses to operate until it gets a motivational speech.', '/upload_media/equipment/0-5k/1/notes/0-5k/57d6ba05-b674-4df2-82b0-caab939726ae.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, E'Dust levels exceeded recommended safe limits—again.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, E'Do not challenge the machine to a staring contest—you will lose.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 5, E'The humming sound is normal. The screaming is not.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, E'If this equipment asks for a raise, politely decline.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, E'All systems nominal, except for the blinking light of mystery.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, E'Removed what seemed to be a nest of paperclips.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, E'Machine insists it\'s not broken, just differently functional.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 5, E'The machine may or may not grant wishes when turned off and on again.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, E'Managed to remove the sticker saying "Kick Me".', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, E'Do not taunt the equipment. It seems to understand sarcasm.', '/upload_media/equipment/0-5k/7/notes/0-5k/58a01401-a793-4fc5-8676-ecc49bda3a1a.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, E'Found no issues except a mild attitude problem.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, E'Equipment demands to be addressed as "Your Highness."', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, E'Machine is now 90% less sticky.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 5, E'Confirmed the equipment does not appreciate knock-knock jokes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, E'It believes we sholuld use the Imperial system. Expect slow performance.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, E'If the equipment starts glowing, evacuate the building.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, E'Do not feed the equipment after midnight. You know the rules.', '/upload_media/equipment/0-5k/8/notes/0-5k/1874937e-22fa-407b-9cc1-00ea5c51bb20.jpg', '/upload_media/equipment/0-5k/8/notes/0-5k/9c1f3e5b-8276-4ea1-8298-9b796f20b7c2.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 3, E'The self-destruct sequence is NOT a feature to be tested.', '/upload_media/equipment/0-5k/9/notes/0-5k/3abe6ba6-0826-4c8c-acb4-fc8f00e642ec.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 4, E'Found extra parts lying around, but everything seems to work.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 5, E'Removed evidence of late-night snack sessions.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, E'The machine is in denial about it\'s age.', '/upload_media/equipment/0-5k/10/notes/0-5k/6c24e643-dc3f-4191-b195-d97853a69f44.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 2, E'If the equipment starts smoking, its not on fire—its just stressed.', '/upload_media/equipment/0-5k/10/notes/0-5k/38038362-9e66-40f6-b69c-90036620c634.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 3, E'It responds well to compliments.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 4, E'The equipment seems to be communicating in Morse code via blinking lights.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 5, E'Discovered the source of the beeping—it was just hungry.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 14, E'Polished to a shine; can now see your reflection. Need a shave!', '/upload_media/equipment/0-5k/11/notes/0-5k/2f043c7a-4a14-46ab-a67e-8a880e5f0fd0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 2, E'Machine believes it\'s a toaster.\nIt is not a toaster.', '/upload_media/equipment/0-5k/12/notes/0-5k/1bc6a36e-28a3-4ff4-bb33-0d737d25db45.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/4bbbc6b2-885e-49c3-8798-4bdcb74872bf.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/5b535f02-5a38-4699-b8ca-ac5e60a33954.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/2300f244-8669-4919-8463-713f9f8cf696.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/22682d31-d0f0-4421-9866-0b25168a1a6f.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/f100c4fc-3453-4ed9-9f15-8328219a4ae8.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/ec5651fe-50b8-490d-8b66-9873c9cc3da3.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/ae704b84-45e9-49e6-a5dc-dbb3ff19fedc.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/a58d860f-3bb5-4239-b014-69ad03cdefc7.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/183029e4-811d-41b7-93e4-4d5f9d85fe69.jpg'),
(12, 3, E'Do not attempt to fix the machine with a hammer.\n\nAgain.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 4, E'Removed traces of glitter bomb.\nThe prank war continues.', '/upload_media/equipment/0-5k/12/notes/0-5k/b48c139d-6fe4-4d45-bcc1-42a69ac340c3.MOV', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 14, E'If found speaking to the equipment, please consult HR. Again', '/upload_media/equipment/0-5k/12/notes/0-5k/027eea60-4544-408f-81d2-9dcb8c721c3f.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/28090d96-0610-455e-8203-468cdcb76858.jpg', '/upload_media/equipment/0-5k/12/notes/0-5k/8897c75f-2cdb-4dcf-9570-59e2f14fedf9.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 5, E'Do not mention obsolescence; it\'s a sensitive topic.', '/upload_media/equipment/0-5k/12/notes/0-5k/93df09f5-9167-445d-b29a-462afa4984fd.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- log_type = 'cleaning', 'sterilization', 'preparation', 'edit'
CREATE TABLE equipment_log (
	id          INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	log_type    TEXT NOT NULL,
	equipment   INT NOT NULL REFERENCES equipment(id) ON DELETE CASCADE,
	create_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	person      INT NOT NULL REFERENCES people(id),
	notes       TEXT,
	field       TEXT,
	old_value   TEXT,
	new_value   TEXT,
	media1      TEXT,
	media2      TEXT,
	media3      TEXT,
	media4      TEXT,
	media5      TEXT,
	media6      TEXT,
	media7      TEXT,
	media8      TEXT,
	media9      TEXT,
	media10     TEXT
);
CREATE INDEX equipment_log_equipment ON equipment_log (equipment);
CREATE INDEX equipment_log_person ON equipment_log (person);
INSERT INTO equipment_log (log_type, equipment, person, notes, field, old_value, new_value, media1, media2, media3, media4, media5, media6, media7, media8, media9, media10) VALUES
('cleaning', 1, 3, E'Found a tiny civilization of dust bunnies; negotiations are ongoing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 1, 5, E'Status changed to "Sentient"; it passed the Turing test.', 'notes', NULL, 'This thing is broken!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 2, 8, E'Moved to the "Noisy Equipment" section; it wouldnt stop humming.', 'location', 'Shelf 1, Cell 8', 'Shelf 12, Cell 12, Row E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 2, 2, E'Updated manual to include "Do not feed after midnight."', 'notes', NULL, 'No water for this one', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('sterilization', 3, 6, E'Sterilized after it started growing it\'s own cultures.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cleaning', 3, 9, E'Removed mysterious sticky substance; taste test inconclusive.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 4, 1, E'Status changed to "Possessed"; it started making eerie sounds.', 'notes', 'I think I saw it floating the other day', 'Beware of spinning head', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 4, 14, E'Edited settings to disable the "Self-Destruct" feature.', 'notes', NULL, '4 8 15 16 3 42 EXECUTE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('archive', 4, 14, E'Too much supernatural activities!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('preparation', 5, 7, E'Prepared for the annual "Equipment Talent Show".', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('sterilization', 5, 12, E'Sterilized after it didnt want to join the bacteria union.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('archive', 6, 4, E'Moved to storage; it needs some "alone time".', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cleaning', 7, 11, E'Cleaned the "Error 404: Cleanliness Not Found".', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 7, 2, E'Status changed to "Mysteriously Wet"; source of moisture unknown.', 'notes', NULL, 'Might be sweatting', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 7, 13, E'Updated firmware to version 1.21 Flask.', 'notes', 'Old version, needs updating', 'Booting it might take some time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('preparation', 8, 5, E'Prepared for interdimensional travel; safety not guaranteed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('sterilization', 9, 10, E'Sterilized after an incident with a radioactive burrito.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 9, 3, E'Adjusted settings to "Do Not Disturb"; it\'s meditating.', 'notes', NULL, 'Ohm!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 10, 6, E'Relocated to Lab 42; because it\'s the answer to everything.', 'location', 'Shelf 2', 'Shelf 42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 11, 8, E'Status changed to "Invisible"; cant find it anywhere.', 'location', 'Shelf 7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cleaning', 11, 1, E'Attempted to clean; ended up in a philosophical debate.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('edit', 12, 4, E'Edited user manual to include "Beware of the Leopard".', 'notes', 'Contains Leopard', 'Contains Leptospira', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('preparation', 12, 7, E'Prepared for upgrade; hoping it doesnt gain self-awareness.', NULL, NULL, NULL, '/upload_media/equipment/0-5k/12/log/0-5k/5c2d1976-dc3c-470f-83aa-ae079caeabb5.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/6b677f79-2ea9-4017-91e2-8c65a34c1f21.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('archive', 12, 14, E'Archiving this because this thing isn\'t working!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('dirty', 12, 14, E'I was wrong. Switched it off and on again and now it\'s working again!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('using', 12, 14, E'Putting to work.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('cleaning', 12, 9, E'Cleaned glitter residue; who had a party without inviting me?', NULL, NULL, NULL, '/upload_media/equipment/0-5k/12/log/0-5k/7f8e508b-c3c7-44d3-9ea1-41abcce96ab7.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/30eed804-0376-4f26-b837-c0311c02ee8d.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/48cb18e0-d047-44d6-bafe-bd2e1fc4cc56.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/b48c139d-6fe4-4d45-bcc1-42a69ac340c3.MOV', '/upload_media/equipment/0-5k/12/log/0-5k/2673c933-9324-40c3-9563-a284702cade9.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/6240c025-6c36-426f-ad3c-48abee4e10d6.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/23429f7c-3f25-46ae-a400-007c9ed26ff2.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/255250f1-8ed0-48d8-93e9-1bcc671a41cc.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/a168aaa4-05da-429c-bde3-53f8258eb954.jpg', '/upload_media/equipment/0-5k/12/log/0-5k/c4d5d6f7-b3a8-42a3-b6f5-d5ebeb7c0da7.jpg'),
('sterilization', 12, 2, E'Flask sterilized, so clean that even the microbes are afraid to enter!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



-- CULTURE

-- culture_contamination_status = 'Clean', 'Xenic', 'Monoxenic', 'Axenic', 'Contaminated', 'ParentContaminated', 'CleanWasContaminated'
CREATE TABLE culture (
	id                   INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	qrcode               TEXT NOT NULL UNIQUE,
	create_date          TIMESTAMPTZ DEFAULT CURRENT_DATE,
	create_by            INT REFERENCES people(id),
	name                 TEXT NOT NULL,
	parent               INT NOT NULL REFERENCES culture(id),
	culture_method       TEXT,
	species              TEXT,
	genus                TEXT,
	location             TEXT,
	storage_conditions   TEXT,
	equipment            INT REFERENCES equipment(id),
	growth_medium        TEXT,
	contamination_status TEXT,
	notes                TEXT
);
