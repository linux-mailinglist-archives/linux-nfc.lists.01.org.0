Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D903F48F8
	for <lists+linux-nfc@lfdr.de>; Mon, 23 Aug 2021 12:50:56 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id E5F33100EBB96;
	Mon, 23 Aug 2021 03:50:48 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.104.109.102; helo=de-smtp-delivery-102.mimecast.com; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CB7A2100EBB7D
	for <linux-nfc@lists.01.org>; Mon, 23 Aug 2021 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629715845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WKmfx37uwqSOodtxmyX45z8fF43jglAGsXH2awUga8=;
	b=UAhlf6i7CbXGjJBk15mtH0K/EVTaUzpeaErMM4wqPTVGiyfRHxc0+HEhARxJmTx2w5YSLH
	3u8FH577x4mZr0SrSbb4qMNTwnGOHRigvH4tbmMojg0a2tVYPy5NSUtT65VNJ4qAKb0tGM
	0MqAKFby/Z4PEe6aUptO3Jbldd3m1hg=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-5Q9P39YqOZimgQ7gtm1FXA-1;
 Mon, 23 Aug 2021 12:50:43 +0200
X-MC-Unique: 5Q9P39YqOZimgQ7gtm1FXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgd9ekXIagmdxQyb6yEvfwQ1tzeSlL13nxVlY/JvdtoMRILTwrQNJX0ZwT/2b/HPBgRLVvU2E3hxksDyT4pg/tTYrbeSy10u4Ioyy7h1ZFjxHftHfWlsMqkGyGV28kIfShD82MfLB71iFc5YXEKcB8odhPVPBtu5iV8aofB3ninK/w9bCsi9CHC5xwi+myJeN4wQ1N5X1UzNnmlPtcyTmXW4GnLgzWKHpXMpqhweHfcWJtrcVEeFHmqcLrjydHsauSxLjdWqk3EJCQAiGRapmMxYVA+LnmOagF1bRcLoyxKX3bkWQi5/NypHIys8abM122U13sOGYXvWMAZsbPYfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex15QoVi6a1vhEd4kv0lzgQcuEXJuEnhTeY+JhG7uwg=;
 b=manQ6Gv163RwAiJAuAYCKOf+QKIRqOR9B6wT4HwYfRPXml4eZ0YjFyaEfZTry0eq8II4xBkFiUIXIe8VoUms+eXjiIcFj8gMIMJCXKbtqAByvLa9ZIDDNEZ69duKlUhq2WubMoJH2mJi3WL0GXmIrZoHGHIabszijQzGUf0hSM7FuCXwehN/GAKxDYcsaeLqnJs8oXbokdXB57u1k2X/H8JPQ3fZ63YEUJ1O6GtGSnxv90EGYwnVJuIDgj4yVdu4kT9WUi1wOBJZkdBPmHvnUkMjL6+3/PEJ4uXUb8w15+wpDjN34dW/s8wviyk4liHsYzhnnkghVfX7hC8Ic7l/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 10:50:42 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4436.022; Mon, 23 Aug 2021
 10:50:42 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 charles.gorand@effinnov.com, andy.shevchenko@gmail.com,
 linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
 <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
From: Oliver Neukum <oneukum@suse.com>
Message-ID: <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
Date: Mon, 23 Aug 2021 12:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: PR3P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::30) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (2001:a61:3ba1:6d01:4428:c443:677c:c419) by PR3P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 10:50:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76ef4c4c-3d61-42ea-e171-08d96623da46
X-MS-TrafficTypeDiagnostic: DBAPR04MB7397:
X-Microsoft-Antispam-PRVS: 
	<DBAPR04MB73977BF91B54635E9D8AF03BC7C49@DBAPR04MB7397.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rJECTyag8eQQVUtcsY7mJaJocKs5I9FvyVHkZgRiHIn1L6W9WxxhImnS88yEgxfvBTl9+6M5Rymxotl4PtSZDBdpA9huL/aojmcxYLXTos1EajGaYppUfqNN/Y8LMPGcA0aj2cuDo1FfuhuqzI7cLs4fVfP8JdrQL6phqk8y+PyZMPqwaKzIYVPPMe4HEe5yZwKB2aF/aDh41YiMsXmnpDVSAQer+bxx9CnfGDaLD9hmosFvdXJH3mrkCyT4OwF7cASEUfZwo/0IRjkC2x/02Ra7DuG9LqEd7AlOfhy4oBdVCb/GFYj/Yo50Cuf3zCyGBrLkq3o5+5T451WoWWHNKjsbVXhgQXxvIpqbcVrd9rL4uh1ZQxImE4yih7RCQKhzPAgFeMYPyi2FtwwjoFtRQ0bUQvPfP69BKqcaYweSmE46YHD8OAbF7s4eK6HbueFVRo0KCNJS+7fgRHfJMCflc3AujskRRnkwlcujZdrAYfcCoXGfZ4ODDlcm/NggnEprmBqfgxGU52LuW3sjDWQVWt2TBRcv+sJ9rF9+sbEwL4wTB9Er4MxV3p6GGw37InTxDb6JO+oY8uDQhHiaS/c6Ibzxe0gt4SDVv/p+mYyOqnUHC9RuFZrEQJHTOUmJvYetOe0GQsOZT50iRkZATDaRBL/P9pax3Ug6rMnqi0UR6OwJVtx76x1KhxrFf9Pn2zdGhXImZ8LvQrAbhmmnbThNtQ93Cp4be7ARoJKXgp+nZGGu4O5A8Tte5aUEetdEn9w9gvHjCZ4N3AIC49C7DWH5DSrkaCn4xj1ANY2opDHf5zarCL2/fOGk7zKCpwzXtWJr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(83380400001)(86362001)(6512007)(66476007)(66946007)(186003)(31696002)(316002)(2616005)(8936002)(36756003)(66556008)(6486002)(31686004)(966005)(508600001)(38100700002)(6506007)(8676002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VPiK3SX8j6wISjx+kuKF8UEmbz/usbxtyyHeuZrlNsKEwgTuBauh6a4kbkA5?=
 =?us-ascii?Q?KDnuFkH6nt8dROcrUuhXcfNfPpfU9zKkv/rLTkPMlD83ID/Bg9vg64VW8DSH?=
 =?us-ascii?Q?M/raGtK123YooVXKC7BThDrnNypZ3PJd308sMWniRupghPwmLuNYR0L2Adfv?=
 =?us-ascii?Q?F/xcIf64dNxiV0AwK3disakuB5MpAItaHUAjsAlt36PaLiaUbUghNUBvi9hd?=
 =?us-ascii?Q?K7EL/Bk2kQAkwHapuzMpkIdIxGjWw2FYq1qF3fcLaaLbt+uaGQAQO70+SKEn?=
 =?us-ascii?Q?NSyvayrkI07LJapfDaEkOxJ+UYp1CaNSSuXaM2KVxDJakrWTGXpguA5XRy//?=
 =?us-ascii?Q?VcXG05GlWP2VIbijaN3jKQF3S0YPavvh4W2ecCpzxlWLJCHeMbGLe7aYAr4Y?=
 =?us-ascii?Q?bXTNAlvICHuBf/TwdHjQcuIjg+IqgcuiAd3yA3l3phOpYwHhcAUppXu+iQ3s?=
 =?us-ascii?Q?E3AnKu7crL34om74aYVzveRUTkCqV3+DoCL1ZJigCadttDqsnuGAJfjOFS6c?=
 =?us-ascii?Q?+AYZSLlsVoWjxbVEFcUt3rG3FNNeWCYHFEXKB0rED0MUo22b2UaOAyogb9Xs?=
 =?us-ascii?Q?FsxZ5qhFN7bIi/MjpcNSfXMn+EKWj0zeSV40sJevvIKJvkzGRaRlPCOQ/3pm?=
 =?us-ascii?Q?sUn739zXzquNrgvgJLWcBY8glVsdqCAgkFePcstwBci0GrEB+6j6Y9aFM6ha?=
 =?us-ascii?Q?B7hqjvtEAcJWYL0uBltGd6ZUB8bNHdLVyzc7/UJg/h7hplbM9s3ihG8rYvEM?=
 =?us-ascii?Q?BOBYeZcQJjIS1J8yYC4oEfWwg8/rnP0B0ou+Ws5I9Thvsl1876RQpm2NssO5?=
 =?us-ascii?Q?I6IH08sFOHs1YkDsz92iD9WItbG8xLB088fO2iHLoFbTjMOeo3X1wiMyACpQ?=
 =?us-ascii?Q?0lozAOpNS16I2/MQY4jcXLFO+3JaCsWktpe5C8DHLs8v7CLBllbms6+HPoWJ?=
 =?us-ascii?Q?vjwUUV+K5DFAd4yZvfACkKffPzl3XEf03kIB5/ygBQydFI7HrnwDVPuXNPCp?=
 =?us-ascii?Q?ivK7buqefA4GWOzELY+HzgUNHeLA+7NJF7wNPXtZDGMFiOyxGaAH9eQOXP3v?=
 =?us-ascii?Q?NN2EoOYaj5QsnIob3ccCcSX1fi8oXOWab4p0FeLTzHxsO3nk7uTY/Rr6M7ez?=
 =?us-ascii?Q?BqEde6qCZKp0bpX2K4nlsyr4wJ3V9XLDric0lObn99D521urqwafCWTe7EWK?=
 =?us-ascii?Q?GM+2R0Jhj2xca1g6k/RbEtANSNRZlL/Mk+3P+q3AoFIiUfqdGo7Hwj6L6pGS?=
 =?us-ascii?Q?pMAJuqpTJypPU1mpDIBqUk5r2CSf9qiXJ+IXLkiGawhKqdQd6Ceo8zcuxWfY?=
 =?us-ascii?Q?av9v9cjaQVCywxOMQD/LGGEoqfsXNsEV/2UZVf/y2kls/VuR+uWkZAXaC6QF?=
 =?us-ascii?Q?GcE4ETKAP/dPSkfWi3n9mkhBHhVR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ef4c4c-3d61-42ea-e171-08d96623da46
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 10:50:42.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRSn4WxlEUmqULEFPRKSG8TBf1hWSG0DB4f8p+Id8R5oS4CLmCrykO3VRL6iyPWv2yRBZq84Ys6x4PtZKlCiOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397
Message-ID-Hash: G2XET6NOPJLK4GRVXNMRIMLNXFDWJJHA
X-Message-ID-Hash: G2XET6NOPJLK4GRVXNMRIMLNXFDWJJHA
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/G2XET6NOPJLK4GRVXNMRIMLNXFDWJJHA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiAxOS4wOC4yMSAxNjo0NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZQ0KSGksDQo+IEhp
LA0KPg0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gSG93ZXZlciB0aGlzDQo+IGlzIHVucGFy
c2VhYmxlLg0KPiBQbGVhc2Ugd3JhcCBjb21taXQNCj4gbWVzc2FnZSBhcm91bmQgNzV0aCBjaGFy
YWN0ZXI6DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEzL3NvdXJjZS9E
b2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCNMMTI0DQo+DQo+IFRo
ZSBzdWJqZWN0IHByZWZpeDogIm5mYzogbnhwLW5jaTogIg0KT0suDQo+IFBsZWFzZSBhbHNvIENj
IGFsbCBwZW9wbGUgYW5kIGxpc3RzLiBZb3UgbWlzc2VkIGhlcmUgbmV0ZGV2DQo+IGFuZCBsaW51
eC1rZXJuZWwsIHNvIHRoaXMgY2Fubm90IGJlIGFwcGxpZWQuDQpEbyB5b3UgcmVhbGx5IHdhbnQg
TEtNTCBvbiBDQyBmb3IgYWxsIE5GQyBwYXRjaGVzPw0KPj4gVGhlIG5lY2Vzc2FyeSBleHRlbnNp
b24gb2YgcnVudGltZSBQTQ0KPj4gdG8gdGhlIE5GQyBkZXZpY2UgcmVxdWlyZXMgdGhhdCBpdA0K
Pj4gYmUgYWN0aXZhdGVkIGFzIGEgY2hpbGQgb2YgdGhlIGkyYyBkZXZpY2UuDQo+PiBJdCBpcyBu
b3QgbmVjZXNzYXJ5IHRvIGRvIGFueSBydW50aW1lIFBNDQo+PiBvcGVyYXRpb25zLiBUaGlzIHdp
bGwgZGlzYWJsZSBydW50aW1lIFBNDQo+PiBmb3IgdGhpcyBicmFuY2ggb2YgdGhlIHRyZWUsIGJ1
dCBvdGhlcndpc2UNCj4+IHRoZSBORkMgZGV2aWNlIGlzIGlub3BlcmFibGUuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4NCj4+IC0tLQ0KPj4g
IGRyaXZlcnMvbmZjL254cC1uY2kvaTJjLmMgfCAxMCArKysrKysrKysrDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZmMv
bnhwLW5jaS9pMmMuYyBiL2RyaXZlcnMvbmZjL254cC1uY2kvaTJjLmMNCj4+IGluZGV4IDk0Zjdm
NmQ5Y2JhZC4uZGJhNzhhNWQyMTdhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9uZmMvbnhwLW5j
aS9pMmMuYw0KPj4gKysrIGIvZHJpdmVycy9uZmMvbnhwLW5jaS9pMmMuYw0KPj4gQEAgLTE4LDYg
KzE4LDcgQEANCj4+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+PiAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9uZmMuaD4NCj4+ICsjaW5jbHVk
ZSA8bGludXgvcG1fcnVudGltZS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+DQo+PiAgI2luY2x1ZGUgPGFzbS91bmFsaWduZWQuaD4NCj4+ICANCj4+IEBAIC0yNjEsNiAr
MjYyLDcgQEAgc3RhdGljIGludCBueHBfbmNpX2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50LA0KPj4gIHsNCj4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Ow0K
Pj4gIAlzdHJ1Y3QgbnhwX25jaV9pMmNfcGh5ICpwaHk7DQo+PiArCXN0cnVjdCBuZmNfZGV2ICpu
ZGV2Ow0KPj4gIAlpbnQgcjsNCj4+ICANCj4+ICAJaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0
eShjbGllbnQtPmFkYXB0ZXIsIEkyQ19GVU5DX0kyQykpIHsNCj4+IEBAIC0yOTcsNiArMjk5LDEx
IEBAIHN0YXRpYyBpbnQgbnhwX25jaV9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwNCj4+ICAJaWYgKHIgPCAwKQ0KPj4gIAkJcmV0dXJuIHI7DQo+PiAgDQo+PiArCW5kZXYgPSBw
aHktPm5kZXYtPm5mY19kZXY7DQo+PiArCXBtX3J1bnRpbWVfc2V0X2FjdGl2ZSgmbmRldi0+ZGV2
KTsNCj4+ICsJcG1fcnVudGltZV9lbmFibGUoJm5kZXYtPmRldik7DQo+PiArCXBtX3J1bnRpbWVf
bWFya19sYXN0X2J1c3koJm5kZXYtPmRldik7DQo+IFNldHRpbmcgUE0gZm9yIHNvbWVvbmUgZWxz
ZSBkb2VzIG5vdCBsb29rIGNvcnJlY3QuIFRoaXMgYnJlYWtzDQpBcyBmYXIgYXMgSSBjYW4gdGVs
bCBJIGFtIGRvaW5nIHRoaXMgZm9yIHRoZSBkZXZpY2Ugbm90ZWQgaW4gbmZjX2Rldi4NCkNvdWxk
IHlvdSBlbGFib3JhdGU/DQo+IGVuY2Fwc3VsYXRpb24gYW5kIHNlcGFyYXRpb24gb2YgdGhlc2Ug
ZmlsZXMuIFRoZSBOQ0kgZGV2aWNlDQo+IChueHBfbmNpX3Byb2JlKCkgYW5kIG90aGVyIHBhcnRz
IG9mIGNvcmUuYykgc2hvdWxkIGluc3RlYWQgbWFuYWdlDQo+IGl0J3Mgb3duIHJ1bnRpbWUgUE0u
DQoNClRoYXQgd291bGQgYmUgYmV0dGVyLiBUaGUgcHJvYmxlbSBJIGVuY291bnRlcmVkIGlzIHRo
YXQgaTJjIGFuZCBVU0IgaGF2ZQ0KZGlmZmVyZW50DQpuZWVkcyBjb25jZXJuaW5nIHJ1bnRpbWUg
UE0uIEFueSBpZGVhcz8NCg0KwqDCoMKgIFJlZ2FyZHMNCsKgwqDCoCDCoMKgwqAgT2xpdmVyDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW5m
YyBtYWlsaW5nIGxpc3QgLS0gbGludXgtbmZjQGxpc3RzLjAxLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGxpbnV4LW5mYy1sZWF2ZUBsaXN0cy4wMS5vcmcKJSh3ZWJfcGFnZV91
cmwpc2xpc3RpbmZvJShjZ2lleHQpcy8lKF9pbnRlcm5hbF9uYW1lKXM=
