Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFFB3F4A1E
	for <lists+linux-nfc@lfdr.de>; Mon, 23 Aug 2021 13:52:50 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 14F54100EBB97;
	Mon, 23 Aug 2021 04:52:49 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.104.109.102; helo=de-smtp-delivery-102.mimecast.com; envelope-from=oneukum@suse.com; receiver=<UNKNOWN> 
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 31114100EBB96
	for <linux-nfc@lists.01.org>; Mon, 23 Aug 2021 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629719564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUCqvaeW3pM4l6oRaZgZD6VGKXHtHLt9kvHWj82NimA=;
	b=hj4925AR4Gvtxq5n7Ej7BdgxkFvPKH+Ham1y6mltVGeIh7WDiC2+qHG0uFkL7RonviL1SQ
	Inqshp/fzhw1OgAwILrOMSkLP+Byfsd3jum5oMJeToX+A2HiyPYAny8ShmDqMohnr91IOA
	so6ovHCUQFy1S5q3yTOFFU8lqwUV+0o=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-Q3Q94Y8SPOSL9c3Vhz5DLA-1;
 Mon, 23 Aug 2021 13:52:43 +0200
X-MC-Unique: Q3Q94Y8SPOSL9c3Vhz5DLA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeHlXj1MzHHQKztMJ6zooGMMuVRjTpb0S0Fcxg+ejRVivfjIQFKWGUhU9I+Su/DlzZck3CJgACI7ZJH9cONOyKjZfYrZjGCF0VxwRWPiXiy0Yz6f/o7S/G8ibW8SLBr7Sr9ltIYVf7n9w5Rl8Fv1yyOMeiC3oAeQVY+R48tWwajaN8mu2bDP2CFO+KDQO6GGPI0SE1eTNPYbIYMbi+uyjfKPjlRjh2sro9rAgrk8iKeigOTJhZJB6pdTdfx9imdeFhzboMIpIkMUWdbPymqAVhly9ZqJBOfrhs42aEVJQelDnP+hqTd3JwUWndPN0rBLg1uhuPc1XjYnTzqWqN2F9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXqO9KYB0ceTxoo5yIzMSf7fVjhL03DG7nJFRShvkIA=;
 b=Lt4atWC3ttB8PVWIHYvkxc+eeN9yFnyClddXatSnvKJ8erbadxdZwv6f2HIrfLIe0wye5bqZIApbjCCvd2no3g+eEsSiqeAsoFohOsN+MlyH/B8H/OivMPgR/FJlmoLnNOe5s8YoyXx9cyWp2NkK3FVDIz4FYw+XjkhQK9ZlkWmysyRdAy+or3yBAegl7qfm7k3cNkSN+ubuFbmPazXOKtTlwjzV4KZvOYPPUtCEjOSD8FxgGbFjLZ9loJGPQLM6o/PXo5n69sxkHiBywKvMwiNPRHvNxfEsdCgByxvqBxgd8/Mnm3YZIdEdZPRcQBX0bUr0uDMV1BP/t4a7ky3vDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB6489.eurprd04.prod.outlook.com (2603:10a6:10:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 11:52:42 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::4cc0:191d:5c04:8ede%7]) with mapi id 15.20.4436.022; Mon, 23 Aug 2021
 11:52:42 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 charles.gorand@effinnov.com, andy.shevchenko@gmail.com,
 linux-nfc@lists.01.org
References: <20210819140228.15591-1-oneukum@suse.com>
 <7ff001e9-8e82-cecb-96af-458baac30dfc@canonical.com>
 <3d825314-4fd5-ac5b-36e9-819cf2bbdb93@suse.com>
 <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
From: Oliver Neukum <oneukum@suse.com>
Message-ID: <b9d1fd42-290e-e60e-92a0-5f0cf3003f90@suse.com>
Date: Mon, 23 Aug 2021 13:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <9219eca0-d6e9-5cec-3113-995743549332@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::29) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (2001:a61:3ba1:6d01:4428:c443:677c:c419) by PR0P264CA0233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 11:52:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1090a333-3de5-467a-851a-08d9662c83ac
X-MS-TrafficTypeDiagnostic: DB8PR04MB6489:
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB6489A4A9B5E96E9C603D1C28C7C49@DB8PR04MB6489.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JahBdcDr/8aJ55jG6ZT80aI1gEKSjAOulkcEFnbd9S1klB5CfGJ6vyVX6DTnkyjpvWDbI/ij7beF9b/8uwvGT7bxUNe/sWzQ4ax3rNmvvO5tZRWms38sTjqejA/YYctSiJ2jbIeP6/LtspG2hKdc4Ug9nVqJmHgntAcwGCrDlYz5ZmsuQvs67qbo4oA08ZoNTb3qitQ0tjJ4Fx5PQ7+SkJVUhe+/adwnThrFUNuO4XXHqz8YSTAp8xX5JxyHzgy8iO9izRsTD66miGI7DTjz/N0O9X476KANPJpuUrDCYzYq4DUxGVORHJmF+n9zFh6FWA5IV0P+bSk7XtaRFNPEFVL/gWa4Rnp38HLySrqR7cppPWSmYdOCZDowGZJ54hZzN8J/Bktl5odkrKQ++oBRTUpGuKC88SK5pFeFnOYQo9sFuhot8GhjMhntaMQTW9WN3wNoBzkr6ftRai+1jclvwwhw7p3/uGXXPzegad5cWGGg6WsLx8IyA9O/04xTWHohE/ckA7vLUmYkOxkBaUNWEFdsDTUEvEj1HdeU4EJM23MwCQO7qPjAik+AQrTJ3WF+UEtnEnpf+vjgC5vQPCAqEm2PORlQBCDvaFPOCQbTA/tzuZyHvdjdGJo3QNYpCTKuxkSgH0qiNKTER9Vv6I8j7LHQ6SS04GD83JNlovAoqzAPqgS6TXrMNHXmkMvD5AWz++Q0dNXKj15G+KU/LNgipLlv4ZWWv7JBth6CpAxGubk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(39850400004)(396003)(366004)(5660300002)(83380400001)(66556008)(66946007)(2906002)(316002)(86362001)(38100700002)(66476007)(36756003)(31696002)(6512007)(6506007)(478600001)(186003)(8936002)(8676002)(53546011)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvlthS0TmCGMwXsv38ZEL2oS2bAROxJClWs10fmrU4/7ru86glAH5RqFP7qq?=
 =?us-ascii?Q?Xn8GQkrhpi0BEN+3puUGFkrb+hqdbpFbUKK/nKnWIW/C4qz/RHlzgeoaqKON?=
 =?us-ascii?Q?Be8oI3AlSE6EiUVfbepzkibjQwNmUzA1mjxK++SPIxAAGpiwAdg2twSp7y30?=
 =?us-ascii?Q?Y8O7EGiI4cksoDA6TTIlDmfG/b71+lP6j2p3rA2EiznDj1kC+dvJxp6zwJsr?=
 =?us-ascii?Q?iNA0wxou71n/MoEF7vIMA3oDLHk1d0ltjKavEEXwV+9JfkIKZFsSRYBZI2Sr?=
 =?us-ascii?Q?T9XWzjZwxB618a22US6KYXOTEuByicJk/PQ/7JFPISHkHf3BEZ8zCIn1Wbu4?=
 =?us-ascii?Q?bAZH6vwA428oruPrwGkRkejf3xzOhY8l6YZKNEz3+nmWszcxnSaVxwxtGRg8?=
 =?us-ascii?Q?gFZRRmBIZFACDW+Rnpw8KUbnfBZGuIlkD03TCfscJ/gd7i5FqCpP+9QWmeEJ?=
 =?us-ascii?Q?5Ir82uCBScBdzDKFW1XE4Lwa386VKAKoEfsDXahocMPT5jnOdFGlykP4mFIL?=
 =?us-ascii?Q?nFjdPIjeEuT7knlj3fqcGNqBcrlkOB9db0/UFkCReh6rZz6turhwZxJJS4Us?=
 =?us-ascii?Q?p0zqej3C8jBeKHj4PxQpAHASJoIussphbYVtt2PIr7OLgZiZuuuS5mDsfdbe?=
 =?us-ascii?Q?fzX2vfJ0WP8mq6vQwTH6epuQG0twkwhwocKGPVnmVx+CLG6+6OIo0iTblngv?=
 =?us-ascii?Q?2VKflqjlNNBsx2hNDF0hSoIssiudDCukOWTMTlFikBqfq42sZN8jPblCjX6S?=
 =?us-ascii?Q?Hr/zzy1tcCfJIoCfaCcfNy9Y5uOUU/tQqnul5fZeR194Z2pu6fcdB4fCfpCg?=
 =?us-ascii?Q?9332IVhuYGmqpsvWjzE4sHyT+E6ZBRULkj1UcjkRCjhOpwk7KmoBm7BKtKFp?=
 =?us-ascii?Q?pUM4PNmOVL7HbR0hTT7G4RsLJ7WEJrfoniuYmd2Dz9IBukUVmELAvVGjNg5n?=
 =?us-ascii?Q?gxhGYaHBNeZ5U/9GrtGQLSUfVe2z9H5A6Pi+KbxddbPJEn9+rhmUZXYutvs5?=
 =?us-ascii?Q?o/216f7qffP+DTsv/nal4t3Jcl/ivYVfBcH5Zxl5MZoGk46DCvg6c0UvRuXl?=
 =?us-ascii?Q?bmIeukecsVThFMFyVxOameqSXrMLYk/lBnlV5B2ZF7pTlxY20LN35X82vQA3?=
 =?us-ascii?Q?lr7Yl5mGMEAn6aCMTIk/FVreLgQgYZGjHHAG0QEFCzh9w95epRoZZwU+dgX3?=
 =?us-ascii?Q?JE0D/8QMrd8wmWOGcXe6kieEVaGllk8JzQI+N/T9RMgIrLjjGpcVBC5vFAcB?=
 =?us-ascii?Q?8tEPK1+nfxATFcbFnfGkMKUGvQwxuv1sEaG60HZs3r8pHqLv9Y9sJXlYQt+i?=
 =?us-ascii?Q?elq4t2KLUsdBfXxNznuiV3+rSxABNkbQMI7b50JWfPIVEb3v+w9FNBJVXoZE?=
 =?us-ascii?Q?on4XKe7r/IneEKQmBa+FYWI0FMJw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090a333-3de5-467a-851a-08d9662c83ac
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 11:52:42.5150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqygqRICHZKeXFjvdq3yGM8E0/s/yYijN+kEnunifbJ7rFsfuRmeW/JBhg8MS5Ll2RcjBvAl8s1UrfzAHOUqhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6489
Message-ID-Hash: QICTMN3A45LQN2DJREP2LTN56NC74XAW
X-Message-ID-Hash: QICTMN3A45LQN2DJREP2LTN56NC74XAW
X-MailFrom: oneukum@suse.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH] NFC: NCI: make parent aware in PM terms
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/QICTMN3A45LQN2DJREP2LTN56NC74XAW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiAyMy4wOC4yMSAxMzoyOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjMv
MDgvMjAyMSAxMjo1MCwgT2xpdmVyIE5ldWt1bSB3cm90ZToNCj4+IE9uIDE5LjA4LjIxIDE2OjQ1
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlDQoNCg0KSGksDQoNCj4+IEkgcGVyc29uYWxseSBs
aWtlIGl0IGEgbG90IGJlY2F1c2UgSSBoYXZlIGZpbHRlcnMgb3JnYW5pemVkIHdpdGggaXQuDQo+
PiBOb3dhZGF5cyBubyBvbmUgcmVhZHMgTEtNTCBpdHNlbGYgKHRvbyBiaWcgdm9sdW1lKSBzbyBp
dCBpcyBwdXJlbHkgZm9yDQo+PiBhcmNoaXZpbmcgb24gbG9yZS5rZXJuZWwub3JnIGZvciBzZWFy
Y2hpbmcgYW5kIGZvciBwZW9wbGUncyBmaWx0ZXJzLg0KPj4NCj4+IFRoZXJlZm9yZSB1bmxlc3Mg
c29tZW9uZSBoZXJlIG9iamVjdHMsIEkgd291bGQgcHJlZmVyIHRvIENjIExLTUwgYXMNCj4+IHdl
bGwuIEFueXdheSwgbmV0ZGV2IGlzIGltcG9ydGFudCBhcyBpdCBpcyB0cmFja2VkIGJ5IHBhdGNo
d29yay4NCnZlcnkgd2VsbCwgSXQgc2hhbGwgYmUgZG9uZS4NCj4+IEFzIGZhciBhcyBJIGNhbiB0
ZWxsIEkgYW0gZG9pbmcgdGhpcyBmb3IgdGhlIGRldmljZSBub3RlZCBpbiBuZmNfZGV2Lg0KPj4g
Q291bGQgeW91IGVsYWJvcmF0ZT8NCj4gSSBtZWFudCB0aGF0IGl0IGxvb2tzIHVudXN1YWwgdGhh
dCB5b3UgZG9uJ3QgZG8gaXQgZm9yIHlvdXIgb3duIGRldmljZQ0KPiAoY2xpZW50LT5kZXYpIGJ1
dCBmb3IgZGV2aWNlIGFsbG9jYXRlZCBpbiBkaWZmZXJlbnQgdW5pdC4gSGVyZSwgeW91DQo+IHJl
Y2VpdmUgY2xpZW50LT5kZXYgYW5kIG1vc3RseSB5b3Ugc2hvdWxkIHBsYXkgb25seSB3aXRoIGl0
Lg0KPg0KPiBXaGlsZSBJIGFtIGxvb2tpbmcgYXQgdGhpcyBtb3JlLCB0aGVyZSBpcyBhbm90aGVy
IGlzc3VlIGFjdHVhbGx5IC0geW91DQo+IHRvdWNoIHJ1bnRpbWUgUE0gb2YgTkZDL05DSSBjb3Jl
IGRldmljZSBidXQgaXQncyB0aGUgTkZDL05DSSBjb3JlIHdobw0KPiBzaG91bGQgaGFuZGxlIGl0
J3Mgb3duIHJ1bnRpbWUgUE0uDQoNCldlbGwsIEkgbG9va2VkIGludG8gdGhhdCBhbmQgdGhhdCB3
YXMgdmVyeSBkaWZmaWN1bHQuIFRoZSBORkMgY29yZSBoYXMNCm5vIGlkZWEgd2hhdCBoYXJkd2Fy
ZSBpdCBpcyBydW5uaW5nIG9uLiBPbiBteSB0ZXN0IGhhcmR3YXJlIGFzIGZhciBhcw0KSSBjYW4g
dGVsbCwgdGhlIHBvd2VyIHN1cHBseSBvZiBteSBORkMgaGFyZHdhcmUgaXMganVzdCB0aWVkIHRv
DQp0aGUgcG93ZXIgc3VwcGx5IG9mIHRoZSBpMmMgaG9zdCBjb250cm9sbGVyLCB3aGljaCBpcyBh
IFBDSSBkZXZpY2UuDQoNCkl0IGdvZXMgaW50byBEM2NvbGQgd2hlbiB0aGUgaTJjIGJ1cyBpcyBu
b3QgdHJhbnNmZXJyaW5nIGFueXRoaW5nLg0KVGhhdCBtYWtlcyBpdCBpbXBvc3NpYmxlIHRvIGFj
dHVhbGx5IGNvbW11bmljYXRlIG92ZXIgTkZDLg0KDQpIb3dldmVyLCBhdCBsZWFzdCBvbiBVU0Ig
c2VuZGluZyBhIGRldmljZSBpbnRvIFVTQiBzdXNwZW5kIHdpdGgNCnJlbW90ZSB3YWtldXAgc2hv
dWxkIHdvcmsuIFNvIEkgZG8gbm90IHNlZSBob3cgdG8gcHV0IHRoaXMgaW50bw0KTkZDIGNvcmUu
DQoNCsKgwqDCoCBSZWdhcmRzDQrCoMKgwqAgwqDCoMKgIE9saXZlcg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbmZjIG1haWxpbmcgbGlzdCAt
LSBsaW51eC1uZmNAbGlzdHMuMDEub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8g
bGludXgtbmZjLWxlYXZlQGxpc3RzLjAxLm9yZwolKHdlYl9wYWdlX3VybClzbGlzdGluZm8lKGNn
aWV4dClzLyUoX2ludGVybmFsX25hbWUpcw==
