-- all active businesses that don't have a sf connection: 2089
select * from business_activation b
left outer join business_onboarding_salesforce bsf
on b.business_id=bsf.created_business_id
where bsf.created_business_id is null
and b.is_archived=0;

-- all active businesses that dont have a sf connection & is not 'Other': 1144
select * from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
where bsf.created_business_id is null
and b.business_type_string != 'Other'
and ba.is_archived=0;


-- businesses in the business_activation table not in the business_onboarding table: 1092
-- why?
select * from business_activation ba
left outer join business_onboarding bo on ba.business_id=bo.created_business
join business b on b.id=ba.business_id
where bo.created_business is null
and ba.is_archived=0;

-- businesses in the business_activation table not in the business_onboarding table & is not 'Other': 975
select * from business_activation ba
left outer join business_onboarding bo on ba.business_id=bo.created_business
join business b on b.id=ba.business_id
where bo.created_business is null
and b.business_type_string != 'Other'
and ba.is_archived=0;


-- businesses in the business_activation table not in the business_onboarding table that were created this year: 173
select business_id from business_activation ba
left outer join business_onboarding bo on ba.business_id=bo.created_business
join business b on b.id=ba.business_id
where bo.created_business is null
and ba.is_archived=0 
and ba.created_at > '2020-12-31'
order by ba.created_at desc;

-- businesses that are in the business_activation table that exist in the business_onboarding_salesforce table instead this year: 2
select * from business_onboarding_salesforce where created_business_id in (24534,7660,24604,24578,24471,24445,24506,24241,24334,24176,23637,24480,24216,24085,24432,24386,24359,24321,24399,24187,24217,24104,24266,24340,24264,24265,24226,24262,9222,24228,24310,24102,24101,24119,24274,24268,24281,23569,24097,24096,24000,24177,24141,24059,24180,24133,23974,24105,23235,23239,24116,24122,24120,23861,23769,3297,23957,24041,23683,3713,24005,23520,23782,23943,23980,21593,23945,22836,23901,21913,23803,23935,23810,20369,23818,23835,23812,23095,23689,20492,23825,23434,23892,23771,23785,23789,23311,23817,23742,23686,23820,23523,22112,23704,23599,23670,23395,23627,23698,23618,23645,23563,23633,23590,23614,23619,23587,23553,23383,23525,23428,23380,23564,23510,23365,23168,23179,23182,23472,23394,22949,23120,23468,8179,23136,23409,23451,20575,23385,23422,23332,23306,23008,21936,23357,3484,22302,22315,22777,22939,10110,23200,23211,22693,18783,23035,23231,22984,22846,22738,22908,22814,23083,22811,22813,22815,23056,23080,23068,22918,22921,22001,16647,23031,23052,18304,22347,22967,22924,22597,22860,22842,19597);

-- businesses in the business_activation table not in the business_onboarding_salesforce table: 2089
-- why?
select * from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
where bsf.created_business_id is null
and ba.is_archived=0;


-- businesses in the business_activation table not in the business_onboarding_salesforce table & is not 'Other': 1144
select * from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
where bsf.created_business_id is null
and b.business_type_string != 'Other'
and ba.is_archived=0;

-- businesses in the business_activation table not in the business_onboarding_salesforce table that were created this year: 175
select * from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
where bsf.created_business_id is null
and ba.created_at > '2020-12-31'
and ba.is_archived=0;



-- trying to figure out the process by which these were created by tracking down who made the businesses
-- people who made businesses that were not inserted into the business_onboarding_salesforce table (not made through clicking sf --> create business) in the past year: 31
select ba.business_id, ba.created_at, ba.updated_at, p.first_name, p.last_name, p.email, ba.activated_by from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
join patron p on p.id=ba.activated_by
where bsf.created_business_id is null
and ba.created_at > '2020-12-31'
and ba.is_archived=0
group by p.email;


-- people who made businesses that were not inserted into the business_onboarding_salesforce table (not made through clicking sf --> create business) all time: 211
select ba.business_id, ba.created_at, ba.updated_at, p.first_name, p.last_name, p.email, ba.activated_by from business_activation ba
left outer join business_onboarding_salesforce bsf on ba.business_id=bsf.created_business_id
join business b on b.id=ba.business_id
join patron p on p.id=ba.activated_by
where bsf.created_business_id is null
and ba.is_archived=0
group by p.email;