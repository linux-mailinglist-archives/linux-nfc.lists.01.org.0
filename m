Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941633D01F
	for <lists+linux-nfc@lfdr.de>; Tue, 16 Mar 2021 09:53:30 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E47E0100EBB86;
	Tue, 16 Mar 2021 01:53:27 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.20.131; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frieder.schrempf@kontron.de; receiver=<UNKNOWN> 
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2131.outbound.protection.outlook.com [40.107.20.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5D801100EBB6F
	for <linux-nfc@lists.01.org>; Tue, 16 Mar 2021 01:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXjkmIloqQDdz8YwMAI9GdjOs0RCFcYGWiN3l1MjBF/749PjEtkazPk0BcJ6CnHoBAZD3T23jhbhHVuV2tCrza4rWBFxKBk405a+G2OOSvgJQOS8TQrmp0ByKj3NHQcoF3ffxziN3j7ZciO3p+NmYOR+yFnPKnkRe1q5flAOcB4I44cP6pG28mIK4jO8ydDIMDMKX3uDcfyKEdQgk7bZOsGPvHX1NX80WbmPuZjECDIM8Qi5lJAwUP5/lc5HU3iXVpuk5uTkvsDZ6xVeDb/G3J52u5MNQU9cDPhQo/AZ30K92T1Q76T+UiZ8ZH2SfAP5RkCdZ1Qwfd49wN+9irM9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKkdHi0Ngg6A5NpzxsJKB3gLWjZUs6tOdJmN3W6RD4g=;
 b=geZmkOIONTEr0nLNKUnezUG9DlKp5PmGEZllBsck5Sg94HgjRsx15kmOV1GWsG8+QMvCnB9FGF5jK3rSM1uXvY7uQ6a82f80QjABkWs2O3HV4Yih8JDRTSQiXn+TadlnGIHv99KsR1wUQtST9dpPKRKnZP7TcMo2tUV5n7eGMjp5hBoJEqOp3DBxwQydMfJ+ym6qM1Te2MESGX0YA6LipdqwNiF/LkeRxRx7c9jNB1e5mTInBjzynecXiDUKkNtUQmF1cWDttRG6O9hTV2BWjO8SB4C/ORjp2PHASp0KAUD6bSlQCpC5uuARRFEwWKXzbdjUbLQeNWHMxfudSSG0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKkdHi0Ngg6A5NpzxsJKB3gLWjZUs6tOdJmN3W6RD4g=;
 b=A7I9M9OtHRwP3GWd+Dpq2NnIaaPgEOUt6aGIDW5zclccr3zV3a7wGTg4gfT7PAydyE/m503/BOORTJwN3bUJ5SmENOHQKEu+RP7QvFQGoDX5VJV7td52dcxVTm8wRMMVM8DC7fz68wg00aDrdE4lc17jGgUXP6nOh+f17RWGii0=
Authentication-Results: holtmann.org; dkim=none (message not signed)
 header.d=none;holtmann.org; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 08:53:22 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 08:53:22 +0000
To: Mark Greer <mgreer@animalcreek.com>
References: <20210311085020.429987-1-frieder.schrempf@kontron.de>
 <20210312012140.GA316619@animalcreek.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <baa083e3-0f3c-6038-7b0b-f1c576d8f200@kontron.de>
Date: Tue, 16 Mar 2021 09:53:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210312012140.GA316619@animalcreek.com>
Content-Language: en-US
X-Originating-IP: [89.244.183.124]
X-ClientProxiedBy: AM0PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:208:be::16) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.183.124) by AM0PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:208:be::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 08:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fa5ac91-5b5b-463e-9b65-08d8e858f42c
X-MS-TrafficTypeDiagnostic: AM8PR10MB4084:
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB408451DD9CA328CB3D701131E96B9@AM8PR10MB4084.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fuolMTZvHgT9q/kCxvB7A8yqLSVxQFJAVgOE6wlEJ94HvH8zQ0tSn5HWt3ePN69NQLCyHYeFY2eWV7rpn1kxCuXXo1hSLqlhd0/Bguj7GfXIULR0sGMg5Wf9rtDTuQ0uQZ02oou3v4OXNCFGpjbaDVUuiHHL64gS4bLm7QWcQqF4BQsY5jbjD3OIT8VKgl153iITSsiy+gEeuLfAfi7Ri0ttBaO1Ofi81bStbZ8qIzda8ClMBlwQV+i6oh1C19sJn//qD2ouUKeXiB20OxQvZ1Ln6AAwzXA3qmCa43dIT4WJqn5HZcIwzKWXK2Y0W2JygjNfqzAzrKqc61+6/W+5DZmD8/m3uxLBqcupRy8A3qJxXRbiHu+nheWIE/VcaaJqiIcA2mbf5Bn9KaKPURgIEl2ii7hT/y1sc/ctIQENKv792T4flNukysA+zXRx4aMyXoB8UR0y7deqr/wqO2wlPlruu3KVAxUndXXfVlTrIUMGdQcPY9iBeFf/G3+IyEKnTcPCrN7URUVzpPpozp6TBCEoD1zy92FAHUkeBSVMptyTmJwqN0PortUfOaf1T/ku9WmMl3GZJIW6gAeVC0It6zsJO9GZBdDl78qAut3FSP4ZKtbDYHaq0ErSkOCCS1Lhk3vJwvJbbRkfGHby6q8v2MgTdCJP9dHwzGiuTR3eyy9oGAsg28HzNfIYSK9zNsjvpVQg2N0SNB5TZ7Vj8dPRYV4jKyF2YK0NJJTtBJCqfdU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(5660300002)(52116002)(186003)(66476007)(6916009)(66946007)(36756003)(966005)(4326008)(8676002)(6486002)(8936002)(66556008)(16576012)(316002)(478600001)(956004)(44832011)(53546011)(83380400001)(86362001)(31696002)(2616005)(26005)(31686004)(2906002)(16526019)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?d05kTTg0VkxZTFE4cytJOTB1R253c05SVjBvSHJWakEwR1V1dk0vZlc5aVFW?=
 =?utf-8?B?ZkNielN3L3F2ZG8wQTVOM2owRVY5Vzh4SS93TFJiVkhFRGJ2emkvdmVyMWxL?=
 =?utf-8?B?aUNRMUlIa251VElhMUY4ajZIdHZNM280RERIWTZNZWJuWkJENi9oTVdGR1VX?=
 =?utf-8?B?YmlGSHVORTZIc0l5MFdaaVFHV0VZZEVNNThGZ25CMkUxa2xzell4Y0pYNW9B?=
 =?utf-8?B?SWtXdTRYSXBBc2tsN2N4YnFoZVh2bWhOUCtodWlmKzB2eXpnMkpXbytZSjJx?=
 =?utf-8?B?UFZWMmMyc2pMYmhsamtudnRrR2FtVzhiT2JXcWxwclk2ZWlVMndFZVJCK3ZD?=
 =?utf-8?B?ZnMzNzV6Y3lVejZ0dkRZN1ZCZmxtVmdPRjdMcE0rZUpZWnRvUEpGV1VQWld0?=
 =?utf-8?B?OEZWd094NERhd3FuZkFnMmJUZitsbUFDMUVHNTl4Y3EvdjVoR3NobnAyZE40?=
 =?utf-8?B?SU9vS2tneGpRY0xVU2pwWUttR0szWGZqMnQyWVhudmhnbWdyeGZZanZoYldl?=
 =?utf-8?B?TGdqQVBaMTNVczFTL1dkWTlMZWp1M3hYSWx6czFKUlFBZytHR2hIZ3VqcnM5?=
 =?utf-8?B?cklZc3lCWXVJL20wd2xRK3dBcytKbnhBK29wSHdFSC9QQVFWUkJUODM5RFhV?=
 =?utf-8?B?R1RXVGEwMVhtWUoreFdEMVU0d3NjWjY3WllUUStTZ3pSbEVkMU04a3NuYVBM?=
 =?utf-8?B?VllFR0FRaEpYZjhraTJGbTFEdFNMdmxqcG9RanAwVVUxai9EZFNJNkZKcE5q?=
 =?utf-8?B?UzF0c3huclMvQTZmb2N5TzJZbitYbzZrWUJQZkJtbytac2hibnJYZmVQWk80?=
 =?utf-8?B?Ni9uWnRiWWhFeUtTbldKYXpJWThpVmVEcTNzbHpQaldvdUEreUtFOEVZUy9v?=
 =?utf-8?B?OVVwS016aGNFOHNEY0h4cm9QM3BzVk1ZQndwb04wa254eHh5RU1yQmhtNDBu?=
 =?utf-8?B?OWszTFRsMGg2NlJ3cEplVHkyaXBpNmQ5QTdjV1kzQU80RmJTalVzRnFIWEZI?=
 =?utf-8?B?eEZLakhrOCtzY05rL1hVR01hMzhodHJJTVRZVjVES2FoMnVMVnk3K0l6SW5Z?=
 =?utf-8?B?Q3p2akl0azN2Y3BtR0xSS3dIRXBKZGJFanF2ZER4cmVHU3NKc01ndVBrQnNa?=
 =?utf-8?B?eVBXWHEzdG54TElnTUVkOHBqWUNiemYxenMrdTN3STVrOExEWVV1Rm9BeUwy?=
 =?utf-8?B?YThQUzN0RDlwTHZ6YWo0YWlweWxqenhpcG9jSzJHNnZVOU9XQ0FsRWwvbGs0?=
 =?utf-8?B?WlNwY0tjeHFXeFVWblpDaGFwcnNxaDVsWjNkek9YUFFqZk1NOGcrT0tSRGVJ?=
 =?utf-8?B?WTNCL3VEbU9xa3pPQzBZaEhHVkIyU2hnZEVHSmNLSUZabFhEdWFVWGxnRTRC?=
 =?utf-8?B?a2dxYjFCUm9PN2hwV25hVHEyemV4Y0NjbTFSSzlRMUdza3BkQ05VMEhwVTJU?=
 =?utf-8?B?ZlRZSjhPVWhBNHJpeEI0OUo1Mzh4QnRtT2lDTTM0RHhzaFk1WmFyU2Y4NklR?=
 =?utf-8?B?YTlvUGZLRW1KNml1SUgwOFh0aW1MOWQ2N21naHAyZWprUE9FUDRuWUo4c2FN?=
 =?utf-8?B?c29jeXNwOXZMZ3VHc1dDM1RGVzZsWTN2NXgvQ1ZvNS9wcVpsNzJnbDNkTUJW?=
 =?utf-8?B?dGJuRW1yWlA4eHhTSnB2UmIzQnVlbXQrQlVQUnRpSE1OMCsrRkplanZGWjdV?=
 =?utf-8?B?bkFnSStDZmxxTGswcy9DOFpPQWEzdEdLL1lHaytiQTNqZ29mR2ppeFB3Nm56?=
 =?utf-8?Q?APH72rqHHkjFtBQzktkW0xIs9kEYdBgboUQAXV4?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa5ac91-5b5b-463e-9b65-08d8e858f42c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 08:53:22.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIqZWhwosm2aSen+5BZuK11Mx4HYCpWFWRht8jjzdGozZYIzuoAEd6r8HAkNcX00mTRaDFQW406Qv7AKq4BFytnCLmTJQU/qb6t1/65qSxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4084
Message-ID-Hash: ZKLZUHM5DG6MOBZU7CHTKR2AWPC5GGXD
X-Message-ID-Hash: ZKLZUHM5DG6MOBZU7CHTKR2AWPC5GGXD
X-MailFrom: frieder.schrempf@kontron.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZKLZUHM5DG6MOBZU7CHTKR2AWPC5GGXD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

Hi Mark,

On 12.03.21 02:21, Mark Greer wrote:
> On Thu, Mar 11, 2021 at 09:50:20AM +0100, Schrempf Frieder wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Hi Frieder.
> 
> I am supposed to be taking over neard maintenance but I have been
> completely derelict in my duties.  I need to refresh my brain's
> cache and look at your patch in more detail.  In the meantime,
> I have a few minor comments below.

Good to hear that you are planning to take over maintainership. I was a 
bit worried to see neard being abandoned.

I also recently found out that Qt has abandoned their support for neard 
in Qt 6 [1], which means that Qt 5.15 is the last version to offer 
integration with neard.

I think that's very unfortunate as this provided a nice and mainline-ish 
stack for NFC devices from the kernel up to the application layer. I 
don't know the reasons for this decision, but neard looking like it is 
not maintained anymore is maybe one of them.

[1] https://bugreports.qt.io/browse/QTBUG-81824

> 
>>
>> This adds a 'Uid' property to the DBus interface for tags, which
>> returns the UID of the tag as byte array.
> 
> Please add more high-level information to this commit description.
> For example, what problem does it solve and how does it solve it?
> Something that we can look back at in 5 years and be satisfied that
> it solved a problem, that it solved the problem in reasonable way,
> and that it was a change worth incorporating.

Ok, I will improve the description to provide more information about 
what this does.

> 
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>   src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 54 insertions(+), 3 deletions(-)
>>
>> diff --git a/src/tag.c b/src/tag.c
>> index 9eba4ee..2039e48 100644
>> --- a/src/tag.c
>> +++ b/src/tag.c
>> @@ -53,6 +53,7 @@ struct near_tag {
>>   	uint8_t nfcid_len;
>>   
>>   	uint8_t iso15693_dsfid;
>> +	uint8_t iso15693_uid_len;
>>   	uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
>>   
>>   	size_t data_length;
>> @@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
>>   	return type;
>>   }
>>   
>> +static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid)
>> +{
>> +	if (tag->nfcid_len) {
>> +		DBG("NFCID: ");
>> +		for(int i = 0; i < tag->nfcid_len; i++)
>                    ^^
> nit: Please put a space between the 'for' and the "('.

Sure

> 
>> +			DBG("%x", tag->nfcid[i]);
>> +
>> +		*uid = tag->nfcid;
>> +
>> +		return tag->nfcid_len;
>> +	} else if (tag->iso15693_uid_len) {
>> +		DBG("ISO-UID: ");
>> +		for(int i = 0; i < tag->iso15693_uid_len; i++)
>                    ^^
> nit: Please put a space between the 'for' and the "('.

Sure

Thanks
Frieder
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
