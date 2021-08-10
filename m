Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030F3E57B0
	for <lists+linux-nfc@lfdr.de>; Tue, 10 Aug 2021 11:58:40 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 8356B100EBBCB;
	Tue, 10 Aug 2021 02:58:38 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.3.133; helo=eur03-am5-obe.outbound.protection.outlook.com; envelope-from=frieder.schrempf@kontron.de; receiver=<UNKNOWN> 
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30133.outbound.protection.outlook.com [40.107.3.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id F3643100EBBC0
	for <linux-nfc@lists.01.org>; Tue, 10 Aug 2021 02:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU9VeRMV2Ce6iqnbaWnLRUx8XOo6IdPK7x0ZRlqA+t0RZGyP7873Wl0gVv4KHaD2doQ7AzRCev1O7tGs0iFZUfbtWnjvl0Xl/x6kbx06ZxYPiNk7zZDimOSShwDBesftKQTrwZOOi7vW2fFRSOOwYE+wzv8TRM0NbysHau6mc8Oq4fElyYOiRShUeKf30+F88NFbtyy6UC+z6Khd4jduKgN7h7gNstJFvS5AwfcOkEfht9bXb1jwHvQXay2F9l8FnGriiOq2JLoplt+IGsuklFeRaGb5Ur+KXMVlNFDaJSsTiaxnEqN4XjsCadUWiQLfwyRPsOPykDFbqMwJXug+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7dOOvzH+oD+bOnznijhqgWRi/8XbruhFIHYeWs0TnI=;
 b=Y17a3HHwELPBCiRYkjZ5gabsYq1FsBDwhh7vbCsOlDfbdsUsjilV+3usMvOMsUZcOHntbcC7PImdjM1MOFrFdutf3qXPmy3iDzeuZi8h5sMxG4btmBFI51wwk9bFAs1M5D9OSIH2zh2zi/TifjzGAuIc2UEOoQkUXnWmOFDA7BHBOklaPdGxT39Z4piGop8cuYzp4lk4yB7piklW5GMlcAKLLzFBvSweARkKYPWf9gkVvT0Ridi+A831BwTgH7pVZFLBK/ojAKn6OfSBKGu2jVHlY8+We5cpmHmY4RGUQdivyNURtaMlVTYvKu3GJ3kpuXa4tcrPN3r3Bg7wJDXN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7dOOvzH+oD+bOnznijhqgWRi/8XbruhFIHYeWs0TnI=;
 b=KHEJCoDdaia8+vugrdNInabP9pQ16iBfndiYcU1NwAsNqQtY29GukH5kLPq4PWkQVDZJPbkb+LNGra9GIR3/MWVa0mroFpjyN/wSVFxq5Tr27207xRaX3yw7/16kGbGN30V35KK2Gn1DYSUolG8dag4USwZShw8JKgMZ9cDzwnk=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4386.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:264::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Tue, 10 Aug
 2021 09:58:33 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::30d6:1ff9:85e4:48d1]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::30d6:1ff9:85e4:48d1%5]) with mapi id 15.20.4415.014; Tue, 10 Aug 2021
 09:58:33 +0000
To: Mark Greer <mgreer@animalcreek.com>
References: <20210316112210.50100-1-frieder.schrempf@kontron.de>
 <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>
 <e925f779-3be9-1d11-81ea-e8841f55381a@kontron.de>
 <20210808015532.GE124928@animalcreek.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <47a612c7-2a97-fc31-1735-dec5648d6167@kontron.de>
Date: Tue, 10 Aug 2021 11:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210808015532.GE124928@animalcreek.com>
Content-Language: en-US
X-ClientProxiedBy: AM5P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::30) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.36] (46.142.64.131) by AM5P194CA0020.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 09:58:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a4d20ac-2350-408c-27e2-08d95be56a1d
X-MS-TrafficTypeDiagnostic: AM9PR10MB4386:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB4386390393ECA36FDF781140E9F79@AM9PR10MB4386.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESOdyBIBjIhwk/F0KOGaHdb9JkA6lZULri1waG8PwwRGCONN17tX/uz5F16zSq0D8NnbU77nvBdEUIBmswdwCxhJn49Kb8fhUiIy9I7Tpefdj6XDXhAmRnf63WAzqLjX71NSCFAhwqqh3lZm5e9vo0Dseyiml1HPe0QrKd/hBg+Q07/6ro5XRyUKACSgttN7DdUGPTeY5I8C6P4ZdIx63E5IkHkS4q+ndbH1Yc4H74u4OtfL8un2/KTavKU1ZXoygtpKB7Az7N60T1XPUFbapuEpflZKECNnRggdm/kyarJfkVa0zdZdOErA89/78YG+L9R+bZkl1ynqQfN9VinOaGXwwEdt928wTKcsM09yui+Tgh6JViyuSJdGw716voHUIkpjlCOm7xPfiwpr3kuQ2ZWh+zFHOd5lIEE+pJR17/Lmp6gbl/EWt/yjiVtXML1YJKYR55Ifby80nTw+TD0b//WidNdMsdJJZbmZsxrhsIjHcvFhR0mCXg+ZYjT+ylueXQzHOwlgH/q8PgFpBNHYFSMfyB64+P1irNgiUmiJ6hTiWMq49BVd1I2S9Wf81KX6eD+bODFnFYnqjLL0TWz7WCHVrNP/A0LNWSI7ZJePKU+4ax64Xm29hFSCnHNirLB9LCeZhjcNBkJd9KEQfqHgzX7G5XOhZ0q7M8bd6L9JL9Adae+jZPprGFMHl4m1fjvtzY8RwhnbIagc3Pfan+mRi4JwuitP7dEyvpIe4lXuNN8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(44832011)(31686004)(54906003)(5660300002)(6916009)(16576012)(2616005)(316002)(956004)(36756003)(66946007)(6486002)(66476007)(53546011)(31696002)(8676002)(66556008)(8936002)(86362001)(2906002)(83380400001)(4326008)(38100700002)(478600001)(26005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHVST3pyMWtvNFpSZ2lqRFlsWCtaeFZpZlg2UmM4NVZLbGV2RUJ1T0RBS3Z6?=
 =?utf-8?B?aGNWeXEzc2dBMGI2c2J1elFNR2lTOFI5RkdGbnlnWWwwenI3RGZtczVPVzN5?=
 =?utf-8?B?NWFuazEwUzhrR3c0ajF3TTQwbnFNdjRIVzdTbVY4RFlCUDhUUlFISXVjbWtX?=
 =?utf-8?B?cWV3TzFzbm5hTEhjY1ZNbUd0QTI3bFhCekNvT3c4ejIxa1JwNTJlRTRHUnky?=
 =?utf-8?B?ejZqM1ZxTktVbDFEYWJRK2UxUHFScHJUbXVaUTlpZnBMeGZoMmt2eUJuMFd1?=
 =?utf-8?B?NzRRbm5yOHpzQ2VzekxwSHRaSDBvMC9DekZkRzVNS0xxeS9lMXVTWXM5cFhr?=
 =?utf-8?B?Mi9laGRqdzFqNDljcmRlV1RGdHp2dTg5OEowR2lscUJDelJ5SDhEMGU2NTVa?=
 =?utf-8?B?bTBHTnc1WjJSZnpxa01yMnB5cnAxWEdzaVR5NmNQby9CM1BJeFdzQUJTMTlV?=
 =?utf-8?B?WkFwUnVIMVdlaklGMGV3bXVLenZrZ1JpWUVzR0NaRUNsRzZSaDh1cEcwN0Fh?=
 =?utf-8?B?NDFPR2ZkekVIeCtMSDU3cjhmckF3TFVhd1BZWHNEQm44amMvczZyZ1ppNjE5?=
 =?utf-8?B?SVdDZjFxSXpDWUwxcVo3and1RDRjWk5wSUpITnRxdW5XU1pZZytuVHlPWWFZ?=
 =?utf-8?B?QzgxYzE3RC9FbUFSMFFXeDJ4NmpiRGtxSWJEb0gwK2NVS2lDcUpPT2p1YTlu?=
 =?utf-8?B?Mm5TVEpTc0FUYmM2c05XaGdsQis2ekpzVXVIYUIyVnNTZHJLZUl3K1pJZWxj?=
 =?utf-8?B?WjdpWThyN2hhYUxUaFc1Wk1uemtKOS9FNHlaY0FZUmZuOU1RNmVub00xSldj?=
 =?utf-8?B?L3U5NzJvb0hDQzV4MlRkUEZ4cXFyY0laVUQ0V1k4ejNoTjlNTTUyd0Z5M2lL?=
 =?utf-8?B?MWpRN1llY0VtYXNua0pXeHp4czdMY21jMU9lSW5KM2hHUFdNenNwTHZXVC9p?=
 =?utf-8?B?WHU1Q2JWSXNFUlBUUm1LSWZPLzlTU3AzOTN4RWpNUjNFWGYwMmxaWm05OTFF?=
 =?utf-8?B?ZU4rd2xrSENQRlo5a00rRkd4SGhVS0V3RzB2VEJIRFJwR3ZPSnRKOFg2TStV?=
 =?utf-8?B?VlhqVTFVOTI2MjIrNTVTM08rc2xyQ0YyT3dqUFZ3OC9NSXdqQUFnQ0loN1RP?=
 =?utf-8?B?bWlqYVFNQUhZUFlYTFV5MXpRamRkekx4ZWMrU0hVMkQ0ZzhFejlhNkN6UHFZ?=
 =?utf-8?B?dFI4N1RXcTgyTWpxOVZUVm9zbldlOVViZzVpTzVHSzBqck1QN2VVRmhJOTls?=
 =?utf-8?B?NTZSK2ZJY0hqcm1TbzhEcTZVZVF4TTI1a3lXWlcwMGl3VXpKUlhYUUFjZUQ0?=
 =?utf-8?B?aEJCWXQ4Z2Z3em1hc2FTZnhyZzhINFFUTUZDZFFjcloxRGcvdFZ1emlSY2xS?=
 =?utf-8?B?U1lld3ZmOWJ3bHhhR2RWZ0hZUmpuYVRRL1dmdWRYQkRZT1NOOW9EK2tLNGFJ?=
 =?utf-8?B?TkJnYlVyYXlVdlozdldpMWtZbkhZS29RdnZ6TUU5SXUrVmxpS2ZlOGdEMDdZ?=
 =?utf-8?B?cHZKa0tsUlo4NEoySzJmZm1pNkFVNUJXQU9vRHFSWHFmN2FPWUtwNExGVTEz?=
 =?utf-8?B?RXZWd1p4eXJMNHBsbjhTMHFrcGhTRS9sdXo0RitQUHhGOGZqVzU3dlRCRjFH?=
 =?utf-8?B?blQ1cGt1bDZlSkJGMXJHbFgvU1Bsbm12a0MzRlA1MThPOCsyUmxnVldrb3Ns?=
 =?utf-8?B?VU51UTdDNVlYMzh4UTFURFF6REFFbEwzeHNLZTZqVVhCNERJMHJqWnp1ajJI?=
 =?utf-8?Q?4+JxgcAavxzStJlLX1cLXzYXOUJwxNTkFZVLWUm?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4d20ac-2350-408c-27e2-08d95be56a1d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 09:58:33.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRYtTwo86vN3C6akkSOm/HCXlbuDHv0ZI+QPLPZrjYk8nhxMRuQ+B7CsSnoufsMbAMFwylZbgVbhnDP6oOqKoWITl9SGAcgdzKoDNAgMMoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4386
Message-ID-Hash: 2X7WVO52MZECXON2C2FHJTXN5OEKAUSK
X-Message-ID-Hash: 2X7WVO52MZECXON2C2FHJTXN5OEKAUSK
X-MailFrom: frieder.schrempf@kontron.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/2X7WVO52MZECXON2C2FHJTXN5OEKAUSK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08.08.21 03:55, Mark Greer wrote:
> On Thu, Mar 18, 2021 at 05:14:35PM +0100, Frieder Schrempf wrote:
>> Hi Fabian,
>>
>> On 16.03.21 19:49, Gottstein, Fabian wrote:
>>> Hi Frieder,
>>>
>>> thanks for the patch.
>>
>> thanks for your feedback.
>>
>>>
>>> Could you please also consider the following situation:
>>> In the case of a NFC Tag Type 1, the identifier is delivered via the RID command (see NFC Digital Protocol). Thus, the Tag's nfcid property is updated in a later step.
>>> To inform the neard users, a property changed signal has to be emitted when nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for the new DBus property should be implemented.
>>
>> I'm new to NFC and D-Bus, so I don't know much about what use-cases and
>> requirements there are.
>>
>> Your request sounds reasonable and I think I have a rough understanding of
>> what is probably needed to implement this. Still to actually do this I need
>> to look at the specifications and the code more closely and I don't know
>> if/when I will find time to do this.
>>
>> Also I don't have any hardware to test this with NFC type 1 tags.
>>
>>>
>>> Another thing regarding building the response message:
>>> The following code snippet could simplify and improve the readability of the usage of the dbus message builder:
>>>
>>> dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS_STRING, &entry);
>>> dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
>>> dbus_message_iter_close_container(iter, &entry);
>>>
>> Thanks for the improved code, I will use this instead.
>>
>> Frieder
> 
> Hi Frieder.
> 
> Do you have an updated version of this patch (or did I miss it)?

No, unfortunately not. I implemented this fix for a project that is now discontinued. I can try to find some time in my spare time to implement at least Fabian's code improvement suggestion. But I don't know if it makes sense to upstream this without the changes Fabian suggested in regard to NFC Tag Type 1 and I currently have neither time to dig into this, nor hardware to test it.

_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
