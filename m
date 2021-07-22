Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8713D2361
	for <lists+linux-nfc@lfdr.de>; Thu, 22 Jul 2021 14:34:48 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5D1A9100EBBDD;
	Thu, 22 Jul 2021 05:34:47 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.21.99; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frieder.schrempf@kontron.de; receiver=<UNKNOWN> 
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2099.outbound.protection.outlook.com [40.107.21.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 51D0A100EBBD7
	for <linux-nfc@lists.01.org>; Thu, 22 Jul 2021 05:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpZzytIr+Zbq9IB0o0M6n3LBOELF0ytPEaFHM6PTP+/3jjx35mAYy0oLTl0PYcV0gIJtC5j82rpiZq9Y/m/TSZf2IMfUp7If7j2cn/OlTYMtvgqMztjBX1UiwaVXTkhF4uDwPGJ+RxOEuiBfAZn0GfO2UV4brXcMnGhYYTGhA2fatfwrQ3gfKXTEiGLJt00UZ61VN+yWexHfkr3vEB4cEqpF8HiGh5eM5bwZoVMBoxIB8O1loPCHpqDrcLcVzT/K66RB7Qhgrcbw4swpvohcfIlOWqAULckcBRZX+JwwQaxDEsnY5J3xWfVLVECr898DDflJyeJn25YedMOtXwflAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6V+HVxWKFUerBg3GGPXEnuv1IXlCbcDA3/rQQc93Cg=;
 b=QdOJbfDgypH94ERARp/+NtjLHBSBuxkDsFOYxk8EzeT1Ljb7S0Hph/otnUZAa0YeVp22hJpADNj+0UPWYEp0/mcMOZM7WXW25G3IiR1bN1Gjui4DGqLqbJtEirreTr+VoCK+LHCIugxvbONNmBqxhkrVF2LLJjlSL5KOR2rs+nRfma38SB6Taf0PkKM9nb7pBNVNf97lKU2I3Vu90+rCRGPCTFF0gnemwvad4IdVf2j8ODxi9uojPd3aPsavV9gx5hAZiNF7n2IbBpFyrFMfM8xaP8wWelNzG0Mtg6Q9PNXVLPGG1oUIKn1UDONFZqkXMPqCOo/jEG8Is1K1YLIuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6V+HVxWKFUerBg3GGPXEnuv1IXlCbcDA3/rQQc93Cg=;
 b=Bw3KZa+tS3YTBolmhKLZ7dnPJ2ZZkn0bCfANmLmxqEbwDXQrDPkOSzcjf8wWUpf1SB4qwxCJSJjeNx+1pYaIB8za/8G/4piO1V8QeWNXk62baBsKhLXR42/gwwihGW5dWrasIi4Y/0L9kvw/nBRhhK9X9n/fiEJB8d2XPYdDn1o=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM9PR10MB4886.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:41b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 12:34:42 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 12:34:42 +0000
To: Vincas Dargis <vindrg@gmail.com>, linux-nfc@lists.01.org
References: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <e35ac631-3b84-f6c5-3f34-b6859f3b709f@kontron.de>
Date: Thu, 22 Jul 2021 14:34:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAPNCXk0qkc-5myby0TdzD=6kBXSd_o_iNGy6jjjO5YXeyZqceg@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM6PR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::32) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (89.247.39.170) by AM6PR01CA0055.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 12:34:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d2f839-c9f1-4797-08f2-08d94d0d1450
X-MS-TrafficTypeDiagnostic: AM9PR10MB4886:
X-Microsoft-Antispam-PRVS: 
	<AM9PR10MB488627BB140F4120F9199D83E9E49@AM9PR10MB4886.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wu+PhfQqw8vGYjkwSBShtsknJCuphhT4MqT9BZ2FauufncMrXEjwXLsQP83Zi6+2z/WgfhTQeYEhiwe8LEu+W79eQWFyF3LGW/mxNjJXCdpqDkJNJEn94Uz5M7eu5shxd4ctuD7hUWqWJt7JtCGloGrZOQxQDy6WBpyjji0mvyMo5B4vZ9/ih8an2vnJOrzwW86yxOnEx32nE+0tXWGyKxHFCd/OavVnTVF4X7gdv8tAZ1SgQj8xE+D8SbN5JvnMxfWICWMGAGeXyR/NQtG2SJiVpKAbt+zIZto43+kTbpRbVV34FNKPk2zSR5G9b5SU7B0R2fXsHPAG8QOtUWs5AyyxlyIoHsvX8M4fEzPAi4EwzgGi/V43Am3repntodsemn7CrLkG5x4n8x9GijVipbhjlA8+goe171Px3VAIk32DNuPUvFjEoZJJUnaOF+IqUC882hBKDcGKP4ZjSMnXmOTNYoFPdsOWeuMOTbiIxk7SnNyL9U25CyWaf4H6FrKPOYq7oh4oVNRehB2dmkFLvEXo/9mz1aSMjInqVw+Q1PSqxbaVYEpT8OgDYMOCoeEuG5tEhy9frHfpOehahpCuNNolM3JSm0AMTvNMKWc3lj/SaTFG9FDKkHpCSZpdUCbIWJ+KMYPoxrB5pxtE+9WmPCWjLXB6k3FU06rcU1gQeJB6asl3UZrwGj6JN8laoYwfoxHdEjhZ0hy/BSW3c67Z2nSocAALszxX6RBPcTF4oyKHsXxfB6qKVTeZZXyalREH0mKw/qy0Fk5r9uOkl0Euhk6PbkiDCYki2JSFzfNr0hg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(478600001)(966005)(66556008)(66476007)(66946007)(956004)(2616005)(16576012)(86362001)(316002)(8936002)(4744005)(31686004)(36756003)(31696002)(8676002)(186003)(44832011)(6486002)(53546011)(26005)(5660300002)(2906002)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWZkc3BnZjBqSUFTSU9uL1lSSkxwbTgyWXFXY0JJbXFyYUxsdmIrWjhDOWNh?=
 =?utf-8?B?V3BSSXQ1SEZBUHV2WDVKOWZ5dytONnpBSXBVVjd5eG9qYitmQWJ1UDhKL3Vv?=
 =?utf-8?B?Z1lpYzE5NGI1cHdMd0c2VWtDNlNCdCtkZUFob1FlWHRDTll6SXhhbUR4ekoz?=
 =?utf-8?B?UG40V0tjMWpqQzNtek5idGlKRmVob3VtV3g5eWpsdGxsTUNuTE85RlM1Y015?=
 =?utf-8?B?K0FFa0dOS0JmOXhSVzc4Q1NTaHQyNVpnSGZsTm9xSG5saUJFMXI1MHF1TWZS?=
 =?utf-8?B?UmNOQlhQTGtnb2J4WjBVZHlqbHlBN3REMjQ0WVB1ZTFTeHltS3R5VFVNTWVZ?=
 =?utf-8?B?TG9BR3VtdXRxTnpNcmI0U3N5RzJzMGpiWmJvSERIYXVCODRkU3RsSDl3Uk5k?=
 =?utf-8?B?N2IxbEUvTmRBOTJtVmMvU1JwanY4dFhpYXFqOTZycU44Y2dweU5lcVp0MHFt?=
 =?utf-8?B?VWhNUHBLYzhwT0l5SkhEcFRvaldQYjQ0N3Yzb2w4Nm1yeXhtdnF1T3JtUEJX?=
 =?utf-8?B?ckpHYlhvTkM0YmJlZmhVSTJGcGVSbFB1VG91TkJoWElJVStPMzQwT3lOVlVJ?=
 =?utf-8?B?czEzK3psUzdvZllCODBJMFRzL1BhdXVQYUU2WENubnRmSnRhb0h3UmJFcEpt?=
 =?utf-8?B?MFhLVkQ2NGlqSStid3htaVBuRGUyT05nek11cGQ3SE1OMjdvQm9HZnBsYW1G?=
 =?utf-8?B?MXlKOW9OVU5mZnQ0a255RzdXMVU2OHJIcTFVSXdGQ0YxL2dDWFozTkZDa09Y?=
 =?utf-8?B?VFg0WjFaeVZvSERvU0wvclUwdG9XeS9hMFpEZUxEUDVseHl2anlkRnA0ZEJQ?=
 =?utf-8?B?ZHhSQ0thY3V6Wkw0VUl6R25QK0lWeHgzZGRna2p1ZVZLRkxDakFYU0FrbjVx?=
 =?utf-8?B?dVZIVHowMEU2ZXJlNTRZaG02eFQ2R2R2YjUyNXFRZVJEMUtHS290MFBMTXU2?=
 =?utf-8?B?TmNiSCs2Z2l0WnIzOTFlVFAzWWRxdGluS3RzT3BiWUtxbTVVL044MndJMVAx?=
 =?utf-8?B?NkE5MVhZaXF6bG1jSTR3UFZBZFJKMkcyNVFvZGE4VHQ5NU5VR09EOGhoQ2NK?=
 =?utf-8?B?NHQwdjlQNzk2TWVhK3Y2NDZQczMwOHFiUjB4YmRrdXFVUTA4bTM2SFNYYmxs?=
 =?utf-8?B?dmFLSnpDMUMxTVVTSmorUml0anBqUUlOeUVoRUdYRzR4L2Qxa1pyT211dnRy?=
 =?utf-8?B?aXhhQ0hzZ2NwNm1wcy9iMzQraG9Qc042c3NtL3VFR0tpT1F1aHRFendrdkRp?=
 =?utf-8?B?bjJpZzBCaFV2Z1lSU2RQZnVrK2ZtNEZMRHdYOGZHSnNHOXhQYkZWYUtwUmlZ?=
 =?utf-8?B?c0Q3MG10MDc2L3lQY2ZWV1AzZFJIWnFSWGIyWGROcHFIbUx3ZmF3MThKVldy?=
 =?utf-8?B?WHNlNnRHNU93QUtreU4xZ1lSdFdPZ3VSNjY5dW5LVkpiNEd1eWVLeDErZzNH?=
 =?utf-8?B?MldURGU1cUcycEtMcmFmWGFldFBlUktGblp2UlhvUlkvOEZKb3ZSVWxrTUwz?=
 =?utf-8?B?WWdseVZGcEtGZFBUQm9ib2RnRUt4anczZCs2TTNhUzUyZmZqdDRrRFFoVUpw?=
 =?utf-8?B?d2Vaem9JWk1vczhEeVF6RUxib2Y5VlkzanBsMElSTFhVa0lKQWt3a2s0UHNT?=
 =?utf-8?B?eEtKK0piQW9hY3piNnRuUitERjJaVXBKbytSNkhLV21Dd2RHSy9vZkZ3dXcv?=
 =?utf-8?B?MFBvVjBZU3hhZ1JkQ3RkV1U4NmxGd2llQTNPSmZibTViRDVEUDZ1V2p1c2hR?=
 =?utf-8?Q?9BBZc4m/5xSPIYe+wNluIEvZGuKPy95/966m0yF?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d2f839-c9f1-4797-08f2-08d94d0d1450
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 12:34:42.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsjYYyb11arpV0KvVaLas0TSV4T4e7q1yVOsv1wKOzD0ArFVEVTvp6ARrYmWNP+r5pN2Y1w78jAXPgPE6T+mau6nzCfeulLmuREbdkOoU2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4886
Message-ID-Hash: EHEBYDD7O2YRALKNHHW5YXAC5CHPBR3E
X-Message-ID-Hash: EHEBYDD7O2YRALKNHHW5YXAC5CHPBR3E
X-MailFrom: frieder.schrempf@kontron.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: About NFC Tag emulation on Linux
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/EHEBYDD7O2YRALKNHHW5YXAC5CHPBR3E/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 22.07.21 12:59, Vincas Dargis wrote:
> Hi list,
> 
> I see there's "test-device", "test-tag" helpers in neard-tools package
> in Debian, but it looks like it needs actual devices/tags to test
> with..?
> 
> Is there a way to emulate NFC tag, to "emit" NFC tag discovery events
> and NDEF mesages on Linux? Qt supports NFC on Linux via neard daemon,

By the way, this is only true for Qt up to version 5.15. They dropped neard support for Qt 6 (see https://bugreports.qt.io/browse/QTBUG-81824).

> so I thought it would be very useful to emulate NFC tags (with various
> payloads) for development and (automated even?) testing.
> 
> Thanks!
> _______________________________________________
> Linux-nfc mailing list -- linux-nfc@lists.01.org
> To unsubscribe send an email to linux-nfc-leave@lists.01.org
> %(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
> 
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
