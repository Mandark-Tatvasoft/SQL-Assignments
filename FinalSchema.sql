-- Table: public.Admin

-- DROP TABLE IF EXISTS public."Admin";

CREATE TABLE IF NOT EXISTS public."Admin"
(
    "AdminId" integer NOT NULL DEFAULT nextval('"Admin_AdminId_seq"'::regclass),
    "AspNetUserId" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "FirstName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(100) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Mobile" character varying(20) COLLATE pg_catalog."default",
    "Address1" character varying(500) COLLATE pg_catalog."default",
    "Address2" character varying(500) COLLATE pg_catalog."default",
    "City" character varying(100) COLLATE pg_catalog."default",
    "RegionId" integer,
    "Zip" character varying(10) COLLATE pg_catalog."default",
    "AltPhone" character varying(20) COLLATE pg_catalog."default",
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "Status" smallint,
    "IsDeleted" boolean,
    "RoleId" integer,
    CONSTRAINT "Admin_pkey" PRIMARY KEY ("AdminId"),
    CONSTRAINT "Admin_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Admin_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Admin_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Admin_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Admin"
    OWNER to postgres;





-- Table: public.AdminRegion

-- DROP TABLE IF EXISTS public."AdminRegion";

CREATE TABLE IF NOT EXISTS public."AdminRegion"
(
    "AdminRegionId" integer NOT NULL DEFAULT nextval('"AdminRegion_AdminRegionId_seq"'::regclass),
    "AdminId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    CONSTRAINT "AdminRegion_pkey" PRIMARY KEY ("AdminRegionId"),
    CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId")
        REFERENCES public."Admin" ("AdminId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."AdminRegion"
    OWNER to postgres;






-- Table: public.AspNetRoles

-- DROP TABLE IF EXISTS public."AspNetRoles";

CREATE TABLE IF NOT EXISTS public."AspNetRoles"
(
    "Id" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "Name" character varying(256) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "AspNetRoles_pkey" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."AspNetRoles"
    OWNER to postgres;







-- Table: public.AspNetUserRoles

-- DROP TABLE IF EXISTS public."AspNetUserRoles";

CREATE TABLE IF NOT EXISTS public."AspNetUserRoles"
(
    "UserId" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "RoleId" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "AspNetUserRoles_pkey" PRIMARY KEY ("UserId", "RoleId"),
    CONSTRAINT "AspNetUserRoles_RoleId_fkey" FOREIGN KEY ("RoleId")
        REFERENCES public."AspNetRoles" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "AspNetUserRoles_UserId_fkey" FOREIGN KEY ("UserId")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."AspNetUserRoles"
    OWNER to postgres;







-- Table: public.AspNetUsers

-- DROP TABLE IF EXISTS public."AspNetUsers";

CREATE TABLE IF NOT EXISTS public."AspNetUsers"
(
    "Id" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "UserName" character varying(256) COLLATE pg_catalog."default" NOT NULL,
    "PasswordHash" character varying COLLATE pg_catalog."default",
    "Email" character varying(256) COLLATE pg_catalog."default",
    "PhoneNumber" character varying(20) COLLATE pg_catalog."default",
    "IP" character varying(20) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone NOT NULL,
    "CreatedDate" timestamp without time zone,
    CONSTRAINT "AspNetUsers_pkey" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."AspNetUsers"
    OWNER to postgres;







-- Table: public.BlockRequests

-- DROP TABLE IF EXISTS public."BlockRequests";

CREATE TABLE IF NOT EXISTS public."BlockRequests"
(
    "BlockRequestId" integer NOT NULL DEFAULT nextval('"BlockRequests_BlockRequestId_seq"'::regclass),
    "PhoneNumber" character varying(50) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default",
    "IsActive" bit(1),
    "Reason" character varying COLLATE pg_catalog."default",
    "RequestId" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    "CreatedDate" timestamp without time zone,
    "ModifiedDate" timestamp without time zone,
    CONSTRAINT "BlockRequests_pkey" PRIMARY KEY ("BlockRequestId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."BlockRequests"
    OWNER to postgres;





-- Table: public.Business

-- DROP TABLE IF EXISTS public."Business";

CREATE TABLE IF NOT EXISTS public."Business"
(
    "BusinessId" integer NOT NULL DEFAULT nextval('"Business_BusinessId_seq"'::regclass),
    "Name" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Address1" character varying(500) COLLATE pg_catalog."default",
    "Address2" character varying(500) COLLATE pg_catalog."default",
    "City" character varying(50) COLLATE pg_catalog."default",
    "RegionId" integer,
    "ZipCode" character varying(10) COLLATE pg_catalog."default",
    "PhoneNumber" character varying(20) COLLATE pg_catalog."default",
    "FaxNumber" character varying(20) COLLATE pg_catalog."default",
    "IsRegistered" bit(1),
    "CreatedBy" character varying(128) COLLATE pg_catalog."default",
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "Status" integer,
    "IsDeleted" bit(1),
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Business_pkey" PRIMARY KEY ("BusinessId"),
    CONSTRAINT "Business_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Business_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Business_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Business"
    OWNER to postgres;








-- Table: public.CaseTag

-- DROP TABLE IF EXISTS public."CaseTag";

CREATE TABLE IF NOT EXISTS public."CaseTag"
(
    "CaseTagId" integer NOT NULL DEFAULT nextval('"CaseTag_CaseTagId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "CaseTag_pkey" PRIMARY KEY ("CaseTagId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."CaseTag"
    OWNER to postgres;







-- Table: public.Concierge

-- DROP TABLE IF EXISTS public."Concierge";

CREATE TABLE IF NOT EXISTS public."Concierge"
(
    "ConciergeId" integer NOT NULL DEFAULT nextval('"Concierge_ConciergeId_seq"'::regclass),
    "ConciergeName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Address" character varying(150) COLLATE pg_catalog."default",
    "Street" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "City" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "State" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "ZipCode" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Concierge_pkey" PRIMARY KEY ("ConciergeId"),
    CONSTRAINT "Concierge_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Concierge"
    OWNER to postgres;







-- Table: public.EmailLog

-- DROP TABLE IF EXISTS public."EmailLog";

CREATE TABLE IF NOT EXISTS public."EmailLog"
(
    "EmailLogID" numeric(9,0) NOT NULL,
    "EmailTemplate" character varying COLLATE pg_catalog."default",
    "SubjectName" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "EmailID" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "ConfirmationNumber" character varying(200) COLLATE pg_catalog."default",
    "FilePath" character varying COLLATE pg_catalog."default",
    "RoleId" integer,
    "RequestId" integer,
    "AdminId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsEmailSent" bit(1),
    "SentTries" integer,
    "Action" integer,
    CONSTRAINT "EmailLog_pkey" PRIMARY KEY ("EmailLogID"),
    CONSTRAINT "EmailLog_AdminId_fkey" FOREIGN KEY ("AdminId")
        REFERENCES public."Admin" ("AdminId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "EmailLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "EmailLog_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "EmailLog_RoleId_fkey" FOREIGN KEY ("RoleId")
        REFERENCES public."Role" ("RoleId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."EmailLog"
    OWNER to postgres;






-- Table: public.HealthProfessionalType

-- DROP TABLE IF EXISTS public."HealthProfessionalType";

CREATE TABLE IF NOT EXISTS public."HealthProfessionalType"
(
    "HealthProfessionalId" integer NOT NULL DEFAULT nextval('"HealthProfessionalType_HealthProfessionalId_seq"'::regclass),
    "ProfessionName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IsActive" bit(1),
    "IsDeleted" bit(1),
    CONSTRAINT "HealthProfessionalType_pkey" PRIMARY KEY ("HealthProfessionalId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HealthProfessionalType"
    OWNER to postgres;






-- Table: public.HealthProfessionals

-- DROP TABLE IF EXISTS public."HealthProfessionals";

CREATE TABLE IF NOT EXISTS public."HealthProfessionals"
(
    "VendorId" integer NOT NULL DEFAULT nextval('"HealthProfessionals_VendorId_seq"'::regclass),
    "VendorName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Profession" integer,
    "FaxNumber" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Address" character varying(150) COLLATE pg_catalog."default",
    "City" character varying(100) COLLATE pg_catalog."default",
    "State" character varying(50) COLLATE pg_catalog."default",
    "Zip" character varying(50) COLLATE pg_catalog."default",
    "RegionId" integer,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedDate" timestamp without time zone,
    "PhoneNumber" character varying(100) COLLATE pg_catalog."default",
    "IsDeleted" bit(1),
    "IP" character varying(20) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default",
    "BusinessContact" character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "HealthProfessionals_pkey" PRIMARY KEY ("VendorId"),
    CONSTRAINT "HealthProfessionals_Profession_fkey" FOREIGN KEY ("Profession")
        REFERENCES public."HealthProfessionalType" ("HealthProfessionalId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "HealthProffesionals_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."HealthProfessionals"
    OWNER to postgres;





-- Table: public.Menu

-- DROP TABLE IF EXISTS public."Menu";

CREATE TABLE IF NOT EXISTS public."Menu"
(
    "MenuId" integer NOT NULL DEFAULT nextval('"Menu_MenuId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "AccountType" smallint NOT NULL,
    "SortOrder" integer,
    CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId"),
    CONSTRAINT "Menu_AccountType_check" CHECK ("AccountType" = ANY (ARRAY[1, 2]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Menu"
    OWNER to postgres;







-- Table: public.Menu

-- DROP TABLE IF EXISTS public."Menu";

CREATE TABLE IF NOT EXISTS public."Menu"
(
    "MenuId" integer NOT NULL DEFAULT nextval('"Menu_MenuId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "AccountType" smallint NOT NULL,
    "SortOrder" integer,
    CONSTRAINT "Menu_pkey" PRIMARY KEY ("MenuId"),
    CONSTRAINT "Menu_AccountType_check" CHECK ("AccountType" = ANY (ARRAY[1, 2]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Menu"
    OWNER to postgres;






-- Table: public.Physician

-- DROP TABLE IF EXISTS public."Physician";

CREATE TABLE IF NOT EXISTS public."Physician"
(
    "PhysicianId" integer NOT NULL DEFAULT nextval('"Physician_PhysicianId_seq"'::regclass),
    "AspNetUserId" character varying(128) COLLATE pg_catalog."default",
    "FirstName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(100) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Mobile" character varying(20) COLLATE pg_catalog."default",
    "MedicalLicense" character varying(500) COLLATE pg_catalog."default",
    "Photo" character varying(100) COLLATE pg_catalog."default",
    "AdminNotes" character varying(500) COLLATE pg_catalog."default",
    "IsAgreementDoc" bit(1),
    "IsBackgroundDoc" bit(1),
    "IsTrainingDoc" bit(1),
    "IsNonDisclosureDoc" bit(1),
    "Address1" character varying(500) COLLATE pg_catalog."default",
    "Address2" character varying(500) COLLATE pg_catalog."default",
    "City" character varying(100) COLLATE pg_catalog."default",
    "RegionId" integer,
    "Zip" character varying(10) COLLATE pg_catalog."default",
    "AltPhone" character varying(20) COLLATE pg_catalog."default",
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "Status" integer,
    "BusinessName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "BusinessWebsite" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "IsDeleted" bit(1),
    "RoleId" integer,
    "NPINumber" character varying(500) COLLATE pg_catalog."default",
    "IsLicenseDoc" bit(1),
    "Signature" character varying(100) COLLATE pg_catalog."default",
    "IsCredentialDoc" bit(1),
    "IsTokenGenerate" bit(1),
    "SyncEmailAddress" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "Physician_pkey" PRIMARY KEY ("PhysicianId"),
    CONSTRAINT "Physician_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Physician_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Physician_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Physician_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Physician_RoleId_fkey" FOREIGN KEY ("RoleId")
        REFERENCES public."Role" ("RoleId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Physician"
    OWNER to postgres;





-- Table: public.PhysicianLocation

-- DROP TABLE IF EXISTS public."PhysicianLocation";

CREATE TABLE IF NOT EXISTS public."PhysicianLocation"
(
    "LocationId" integer NOT NULL DEFAULT nextval('"PhysicianLocation_LocationId_seq"'::regclass),
    "PhysicianId" integer NOT NULL,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6),
    "CreatedDate" timestamp without time zone,
    "PhysicianName" character varying(50) COLLATE pg_catalog."default",
    "Address" character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT "PhysicianLocation_pkey" PRIMARY KEY ("LocationId"),
    CONSTRAINT "PhysicianLocation_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."PhysicianLocation"
    OWNER to postgres;







-- Table: public.PhysicianNotification

-- DROP TABLE IF EXISTS public."PhysicianNotification";

CREATE TABLE IF NOT EXISTS public."PhysicianNotification"
(
    id integer NOT NULL DEFAULT nextval('"PhysicianNotification_id_seq"'::regclass),
    "PhysicianId" integer NOT NULL,
    "IsNotificationStopped" bit(1) NOT NULL,
    CONSTRAINT "PhysicianNotification_pkey" PRIMARY KEY (id),
    CONSTRAINT "PhysicianNotification_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."PhysicianNotification"
    OWNER to postgres;







-- Table: public.PhysicianRegion

-- DROP TABLE IF EXISTS public."PhysicianRegion";

CREATE TABLE IF NOT EXISTS public."PhysicianRegion"
(
    "PhysicianRegionId" integer NOT NULL DEFAULT nextval('"PhysicianRegion_PhysicianRegionId_seq"'::regclass),
    "PhysicianId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    CONSTRAINT "PhysicianRegion_pkey" PRIMARY KEY ("PhysicianRegionId"),
    CONSTRAINT "PhysicianRegion_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "PhysicianRegion_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."PhysicianRegion"
    OWNER to postgres;







-- Table: public.Region

-- DROP TABLE IF EXISTS public."Region";

CREATE TABLE IF NOT EXISTS public."Region"
(
    "RegionId" integer NOT NULL DEFAULT nextval('"Region_RegionId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Abbreviation" character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "Region_pkey" PRIMARY KEY ("RegionId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Region"
    OWNER to postgres;







-- Table: public.Request

-- DROP TABLE IF EXISTS public."Request";

CREATE TABLE IF NOT EXISTS public."Request"
(
    "RequestId" integer NOT NULL DEFAULT nextval('"Request_RequestId_seq"'::regclass),
    "RequestTypeId" integer NOT NULL,
    "UserId" integer,
    "FirstName" character varying(100) COLLATE pg_catalog."default",
    "LastName" character varying(100) COLLATE pg_catalog."default",
    "PhoneNumber" character varying(23) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default",
    "Status" integer NOT NULL DEFAULT 1,
    "PhysicianId" integer,
    "ConfirmationNumber" character varying(20) COLLATE pg_catalog."default",
    "CreatedDate" timestamp without time zone NOT NULL DEFAULT now(),
    "IsDeleted" bit(1),
    "ModifiedDate" timestamp without time zone,
    "DeclinedBy" character varying(250) COLLATE pg_catalog."default",
    "IsUrgentEmailSent" bit(1),
    "LastWellnessDate" timestamp without time zone,
    "IsMobile" bit(1),
    "CallType" integer,
    "CompletedByPhysician" bit(1),
    "LastReservationDate" timestamp without time zone,
    "AcceptedDate" timestamp without time zone,
    "RelationName" character varying(100) COLLATE pg_catalog."default",
    "CaseNumber" character varying(50) COLLATE pg_catalog."default",
    "IP" character varying(20) COLLATE pg_catalog."default",
    "CaseTag" character varying(50) COLLATE pg_catalog."default",
    "CaseTagPhysician" character varying(50) COLLATE pg_catalog."default",
    "PatientAccountId" character varying(128) COLLATE pg_catalog."default",
    "CreatedUserId" integer,
    CONSTRAINT "Request_pkey" PRIMARY KEY ("RequestId"),
    CONSTRAINT "Request_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Request_RequestTypeId_fkey" FOREIGN KEY ("RequestTypeId")
        REFERENCES public."RequestType" ("RequestTypeId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Request_UserId_fkey" FOREIGN KEY ("UserId")
        REFERENCES public."User" ("UserId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Request_RequestTypeId_check" CHECK ("RequestTypeId" = ANY (ARRAY[1, 2, 3, 4])),
    CONSTRAINT "Request_Status_check" CHECK ("Status" = ANY (ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Request"
    OWNER to postgres;







-- Table: public.RequestBusiness

-- DROP TABLE IF EXISTS public."RequestBusiness";

CREATE TABLE IF NOT EXISTS public."RequestBusiness"
(
    "RequestBusinessId" integer NOT NULL DEFAULT nextval('"RequestBusiness_RequestBusinessId_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "BusinessId" integer NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "RequestBusiness_pkey" PRIMARY KEY ("RequestBusinessId"),
    CONSTRAINT "RequestBusiness_BusinessId_fkey" FOREIGN KEY ("BusinessId")
        REFERENCES public."Business" ("BusinessId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestBusiness_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestBusiness"
    OWNER to postgres;







-- Table: public.RequestClient

-- DROP TABLE IF EXISTS public."RequestClient";

CREATE TABLE IF NOT EXISTS public."RequestClient"
(
    "RequestClientId" integer NOT NULL DEFAULT nextval('"RequestClient_RequestClientId_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "FirstName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(100) COLLATE pg_catalog."default",
    "PhoneNumber" character varying(23) COLLATE pg_catalog."default",
    "Location" character varying(100) COLLATE pg_catalog."default",
    "Address" character varying(500) COLLATE pg_catalog."default",
    "RegionId" integer,
    "NotiMobile" character varying(20) COLLATE pg_catalog."default",
    "NotiEmail" character varying(50) COLLATE pg_catalog."default",
    "Notes" character varying(500) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default",
    "strMonth" character varying(20) COLLATE pg_catalog."default",
    "intYear" integer,
    "intDate" integer,
    "IsMobile" bit(1),
    "Street" character varying(100) COLLATE pg_catalog."default",
    "City" character varying(100) COLLATE pg_catalog."default",
    "State" character varying(100) COLLATE pg_catalog."default",
    "ZipCode" character varying(10) COLLATE pg_catalog."default",
    "CommunicationType" integer,
    "RemindReservationCount" integer,
    "RemindHouseCallCount" integer,
    "IsSetFollowupSent" integer,
    "IP" character varying(20) COLLATE pg_catalog."default",
    "IsReservationReminderSent" integer,
    "Latitude" numeric(9,6),
    "Longitude" numeric(9,6),
    CONSTRAINT "RequestClient_pkey" PRIMARY KEY ("RequestClientId"),
    CONSTRAINT "RequestClient_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestClient_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestClient"
    OWNER to postgres;






-- Table: public.RequestClosed

-- DROP TABLE IF EXISTS public."RequestClosed";

CREATE TABLE IF NOT EXISTS public."RequestClosed"
(
    "RequestClosedId" integer NOT NULL DEFAULT nextval('"RequestClosed_RequestClosedId_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "RequestStatusLogId" integer NOT NULL,
    "PhyNotes" character varying(500) COLLATE pg_catalog."default",
    "ClientNotes" character varying(500) COLLATE pg_catalog."default",
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "RequestClosed_pkey" PRIMARY KEY ("RequestClosedId"),
    CONSTRAINT "RequestClosed_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestClosed_RequestStatusLogId_fkey" FOREIGN KEY ("RequestStatusLogId")
        REFERENCES public."RequestStatusLog" ("RequestStatusLogId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestClosed"
    OWNER to postgres;







-- Table: public.RequestConcierge

-- DROP TABLE IF EXISTS public."RequestConcierge";

CREATE TABLE IF NOT EXISTS public."RequestConcierge"
(
    "Id" integer NOT NULL DEFAULT nextval('"RequestConcierge_Id_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "ConciergeId" integer NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "RequestConcierge_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "RequestConcierge_ConciergeId_fkey" FOREIGN KEY ("ConciergeId")
        REFERENCES public."Concierge" ("ConciergeId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestConcierge_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestConcierge"
    OWNER to postgres;







-- Table: public.RequestNotes

-- DROP TABLE IF EXISTS public."RequestNotes";

CREATE TABLE IF NOT EXISTS public."RequestNotes"
(
    "RequestNotesId" integer NOT NULL DEFAULT nextval('"RequestNotes_RequestNotesId_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "strMonth" character varying(20) COLLATE pg_catalog."default",
    "intYear" integer,
    "intDate" integer,
    "PhysicianNotes" character varying(500) COLLATE pg_catalog."default",
    "AdminNotes" character varying(500) COLLATE pg_catalog."default",
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "IP" character varying(20) COLLATE pg_catalog."default",
    "AdministrativeNotes" character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT "RequestNotes_pkey" PRIMARY KEY ("RequestNotesId"),
    CONSTRAINT "RequestNotes_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestNotes_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestNotes_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestNotes"
    OWNER to postgres;







-- Table: public.RequestStatusLog

-- DROP TABLE IF EXISTS public."RequestStatusLog";

CREATE TABLE IF NOT EXISTS public."RequestStatusLog"
(
    "RequestStatusLogId" integer NOT NULL DEFAULT nextval('"RequestStatusLog_RequestStatusLogId_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "Status" integer NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "TransToPhysicianId" integer,
    "Notes" character varying(500) COLLATE pg_catalog."default",
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    "TransToAdmin" bit(1),
    CONSTRAINT "RequestStatusLog_pkey" PRIMARY KEY ("RequestStatusLogId"),
    CONSTRAINT "RequestStatusLog_AdminId_fkey" FOREIGN KEY ("AdminId")
        REFERENCES public."Admin" ("AdminId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestStatusLog_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestStatusLog_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestStatusLog_TransToPhysicianId_fkey" FOREIGN KEY ("TransToPhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestStatusLog"
    OWNER to postgres;







-- Table: public.RequestType

-- DROP TABLE IF EXISTS public."RequestType";

CREATE TABLE IF NOT EXISTS public."RequestType"
(
    "RequestTypeId" integer NOT NULL DEFAULT nextval('"RequestType_RequestTypeId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "RequestType_pkey" PRIMARY KEY ("RequestTypeId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestType"
    OWNER to postgres;







-- Table: public.RequestWiseFile

-- DROP TABLE IF EXISTS public."RequestWiseFile";

CREATE TABLE IF NOT EXISTS public."RequestWiseFile"
(
    "RequestWiseFileID" integer NOT NULL DEFAULT nextval('"RequestWiseFile_RequestWiseFileID_seq"'::regclass),
    "RequestId" integer NOT NULL,
    "FileName" character varying(500) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "PhysicianId" integer,
    "AdminId" integer,
    "DocType" integer,
    "IsFrontSide" bit(1),
    "IsCompensation" bit(1),
    "IP" character varying(20) COLLATE pg_catalog."default",
    "IsFinalize" bit(1),
    "IsDeleted" bit(1),
    "IsPatientRecords" bit(1),
    CONSTRAINT "RequestWiseFile_pkey" PRIMARY KEY ("RequestWiseFileID"),
    CONSTRAINT "RequestWiseFile_AdminId_fkey" FOREIGN KEY ("AdminId")
        REFERENCES public."Admin" ("AdminId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestWiseFile_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RequestWiseFile_RequestId_fkey" FOREIGN KEY ("RequestId")
        REFERENCES public."Request" ("RequestId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RequestWiseFile"
    OWNER to postgres;







-- Table: public.Role

-- DROP TABLE IF EXISTS public."Role";

CREATE TABLE IF NOT EXISTS public."Role"
(
    "RoleId" integer NOT NULL DEFAULT nextval('"Role_RoleId_seq"'::regclass),
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "AccountType" integer NOT NULL,
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "IsDeleted" bit(1) NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Role_pkey" PRIMARY KEY ("RoleId"),
    CONSTRAINT "Role_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Role_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Role_AccountType_check" CHECK ("AccountType" = ANY (ARRAY[1, 2]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Role"
    OWNER to postgres;







-- Table: public.RoleMenu

-- DROP TABLE IF EXISTS public."RoleMenu";

CREATE TABLE IF NOT EXISTS public."RoleMenu"
(
    "RoleMenuId" integer NOT NULL DEFAULT nextval('"RoleMenu_RoleMenuId_seq"'::regclass),
    "RoleId" integer NOT NULL,
    "MenuId" integer NOT NULL,
    CONSTRAINT "RoleMenu_pkey" PRIMARY KEY ("RoleMenuId"),
    CONSTRAINT "RoleMenu_MenuId_fkey" FOREIGN KEY ("MenuId")
        REFERENCES public."Menu" ("MenuId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RoleMenu_RoleId_fkey" FOREIGN KEY ("RoleId")
        REFERENCES public."Role" ("RoleId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RoleMenu"
    OWNER to postgres;







-- Table: public.SMSLog

-- DROP TABLE IF EXISTS public."SMSLog";

CREATE TABLE IF NOT EXISTS public."SMSLog"
(
    "SMSLogID" numeric(9,0) NOT NULL,
    "SMSTemplate" character varying COLLATE pg_catalog."default" NOT NULL,
    "MobileNumber" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "ConfirmationNumber" character varying(200) COLLATE pg_catalog."default",
    "RoleId" integer,
    "AdminId" integer,
    "RequestId" integer,
    "PhysicianId" integer,
    "CreateDate" timestamp without time zone NOT NULL,
    "SentDate" timestamp without time zone,
    "IsSMSSent" bit(1),
    "SentTries" integer NOT NULL,
    "Action" integer,
    CONSTRAINT "SMSLog_pkey" PRIMARY KEY ("SMSLogID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."SMSLog"
    OWNER to postgres;







-- Table: public.Shift

-- DROP TABLE IF EXISTS public."Shift";

CREATE TABLE IF NOT EXISTS public."Shift"
(
    "ShiftId" integer NOT NULL DEFAULT nextval('"Shift_ShiftId_seq"'::regclass),
    "PhysicianId" integer NOT NULL,
    "StartDate" date NOT NULL,
    "IsRepeat" bit(1) NOT NULL,
    "WeekDays" character(7) COLLATE pg_catalog."default",
    "RepeatUpto" integer,
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "IP" character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Shift_pkey" PRIMARY KEY ("ShiftId"),
    CONSTRAINT "Shift_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Shift_PhysicianId_fkey" FOREIGN KEY ("PhysicianId")
        REFERENCES public."Physician" ("PhysicianId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Shift"
    OWNER to postgres;







-- Table: public.ShiftDetail

-- DROP TABLE IF EXISTS public."ShiftDetail";

CREATE TABLE IF NOT EXISTS public."ShiftDetail"
(
    "ShiftDetailId" integer NOT NULL DEFAULT nextval('"ShiftDetail_ShiftDetailId_seq"'::regclass),
    "ShiftId" integer NOT NULL,
    "ShiftDate" timestamp without time zone NOT NULL,
    "RegionId" integer,
    "StartTime" time without time zone NOT NULL,
    "EndTime" time without time zone NOT NULL,
    "Status" integer NOT NULL,
    "IsDeleted" bit(1) NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "LastRunningDate" timestamp without time zone,
    "EventId" character varying(100) COLLATE pg_catalog."default",
    "IsSync" bit(1),
    CONSTRAINT "ShiftDetail_pkey" PRIMARY KEY ("ShiftDetailId"),
    CONSTRAINT "ShiftDetail_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ShiftDetail_ShiftId_fkey" FOREIGN KEY ("ShiftId")
        REFERENCES public."Shift" ("ShiftId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ShiftDetail"
    OWNER to postgres;







-- Table: public.ShiftDetailRegion

-- DROP TABLE IF EXISTS public."ShiftDetailRegion";

CREATE TABLE IF NOT EXISTS public."ShiftDetailRegion"
(
    "ShiftDetailRegionId" integer NOT NULL DEFAULT nextval('"ShiftDetailRegion_ShiftDetailRegionId_seq"'::regclass),
    "ShiftDetailId" integer NOT NULL,
    "RegionId" integer NOT NULL,
    "IsDeleted" bit(1),
    CONSTRAINT "ShiftDetailRegion_pkey" PRIMARY KEY ("ShiftDetailRegionId"),
    CONSTRAINT "ShiftDetailRegion_RegionId_fkey" FOREIGN KEY ("RegionId")
        REFERENCES public."Region" ("RegionId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ShiftDetailRegion_ShiftDetailId_fkey" FOREIGN KEY ("ShiftDetailId")
        REFERENCES public."ShiftDetail" ("ShiftDetailId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ShiftDetailRegion"
    OWNER to postgres;







-- Table: public.User

-- DROP TABLE IF EXISTS public."User";

CREATE TABLE IF NOT EXISTS public."User"
(
    "UserId" integer NOT NULL,
    "AspNetUserId" character varying(128) COLLATE pg_catalog."default",
    "FirstName" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "LastName" character varying(100) COLLATE pg_catalog."default",
    "Email" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Mobile" character varying(20) COLLATE pg_catalog."default",
    "IsMobile" bit(1),
    "Street" character varying(100) COLLATE pg_catalog."default",
    "City" character varying(100) COLLATE pg_catalog."default",
    "State" character varying(100) COLLATE pg_catalog."default",
    "RegionId" integer,
    "ZipCode" character varying(10) COLLATE pg_catalog."default",
    "strMonth" character varying(20) COLLATE pg_catalog."default",
    "intYear" integer,
    "intDate" integer,
    "CreatedBy" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL,
    "ModifiedBy" character varying(128) COLLATE pg_catalog."default",
    "ModifiedDate" timestamp without time zone,
    "Status" integer,
    "IsDeleted" bit(1),
    "IP" character varying(20) COLLATE pg_catalog."default",
    "IsRequestWithEmail" bit(1),
    CONSTRAINT "User_pkey" PRIMARY KEY ("UserId"),
    CONSTRAINT "User_AspNetUserId_fkey" FOREIGN KEY ("AspNetUserId")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "User_CreatedBy_fkey" FOREIGN KEY ("CreatedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "User_ModifiedBy_fkey" FOREIGN KEY ("ModifiedBy")
        REFERENCES public."AspNetUsers" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."User"
    OWNER to postgres;
