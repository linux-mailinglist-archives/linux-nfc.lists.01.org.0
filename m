Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A8633D2DE
	for <lists+linux-nfc@lfdr.de>; Tue, 16 Mar 2021 12:22:28 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id BBA87100EBB92;
	Tue, 16 Mar 2021 04:22:24 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.2.113; helo=eur02-ve1-obe.outbound.protection.outlook.com; envelope-from=frieder.schrempf@kontron.de; receiver=<UNKNOWN> 
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20113.outbound.protection.outlook.com [40.107.2.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 5B159100EBB86
	for <linux-nfc@lists.01.org>; Tue, 16 Mar 2021 04:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLz2UfFY/dvm98bmEyVOii65URk9qc/Iw06kRFfvISMs5p5kBuQoJ6mJtfdue74bvwp0KBrKoGx9OAebUZF/LtZIkZqRdxHn1ZDlKpa2qRymM6Gm3D85idI+DnjR0rgQ59iuHeiCmHFf2hT2+qGW2CZBz18SocuycpCRC8LXHPijE/2M/PHA8ErM5yCF/JZC0G4mic5MvPxundnJWWTRNOg7cyNG5CYuxTGBZJ8Ag5Vh5oApour5beGIJiG24Ve5VQpBJwTue9TbAcdkjn7aFUxRgUpWxWf1Xn0YYKCaDo0OSrI3iA4LeUN5k7+ZxMiAGS32XoG/SnSqakQ7L7qUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/ysmu2hSklZBQchwTxUflpymyni8FrVM4EJRXEwP0=;
 b=WfcaurGugHjC/XGvNIuBgCFHH6/sIXvoWe5Z9rZ4fI3Nsy4lDw2eLnX5X2QP+eYkgc+RLI0rhSgaVD12lYGcHNbf5E8zhZ0pY+7zVruQzjtUk6ITeI49WROWRlzi/gxxfWGMRq+VZVFY4qyNTzeBA5Zo45KsZ2l2zDJhpj8vv86L+CSd0EVxkBpkS+Z8cOIQteBKx4A36oXz38AIrp0o+XkzIlKc717v0XPC0W7Ql0qoWpF5d4sXf+51KEHNNu0yvSAscUEzUFSEu41FkOV3udS9zHEqz7BE/OPyjUuBffvJVxcB2VwvIoJ5sunR8WsSwaQy+q3CUF1kgJonuwXFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p/ysmu2hSklZBQchwTxUflpymyni8FrVM4EJRXEwP0=;
 b=mtLrAyOaQyJWVzrr84fnLxCoBbkfrAiTJeqL5ogvzQLJQCTcoVm3MlYbna/RxHshratr26jiAXDmJi3igZnHFGPsAEtlJpLp9SoGky/PQt2ybW0aZoqg+nZGZBQxCobltbmawd/AGTL7XEZYDPOwRSJUWUqj0ntORkuT0rRC/bs=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 11:22:20 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 11:22:20 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Samuel Ortiz <sameo@linux.intel.com>,
	linux-nfc@lists.01.org
Date: Tue, 16 Mar 2021 12:22:10 +0100
Message-Id: <20210316112210.50100-1-frieder.schrempf@kontron.de>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [89.244.183.124]
X-ClientProxiedBy: AM9P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::10) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fs-work.ked.local (89.244.183.124) by AM9P192CA0005.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 11:22:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8cc0b80-9266-46f7-fe1d-08d8e86dc34f
X-MS-TrafficTypeDiagnostic: AM0PR10MB2068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB20680D4AB8446002D9E7DC87E96B9@AM0PR10MB2068.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KbBsPHZx9+71D4J+vxv6HVL5WvOiF2Cl+kEGL5N7nGci9zePD2JDi7BDWshCCnIl64G0hUmCuRQEerlPleGGosAl40QpIUq2VlsjX+hojsAIr9PboA09MsjlojUFt/O2K7/vrhz12N65Ve5AprTTTBZOax0Nz+mUz1jO+KittsNQEhKAWhMQt2gTmROYdjvkdFFtUtz0PqBWb1Agwdi9F45qv+lF6GNKQB3pGJZQbg7BBK2o8Rrr8D46SzrUa+hZ4o8otzo3okGnQZvfcwcTPjK5giJlNuE5TY32W41aV+OByk61+yUg/vuXHpQ4Rk0BrH4l2PKbOHx/ghC6vOieWzudYOotY981y1y5xyMpnRs9wZz/AyUlMDWUI/QT2FP9TmW2jzxsv3A3TvO+v7W5AaPSniI03JZn+EP8vqRY/9oXCW1QpDgH8IVJG0xxv1tdr+YbyKNlMPqu5Mzf7mKpycywdjsL9etodJ/RXsFD5Q5oyLA+1MeNwDLkhGwnoIHcn+tLamJG1IbOG9AAMH7ujyf3M4SloZUBq46eqgluzabUTyCEaks2mlwC7jgkZvdf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(36756003)(6506007)(8676002)(478600001)(5660300002)(26005)(956004)(4326008)(86362001)(8936002)(83380400001)(54906003)(52116002)(16526019)(6486002)(186003)(6666004)(316002)(6512007)(66476007)(2906002)(66946007)(2616005)(107886003)(1076003)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qK8tK676oXveGoXH8AMy/txHf1eTx2kMnOIMA85Jk1H4EcXeNiIQfCbYsAwp?=
 =?us-ascii?Q?LBp1EATHzGNCYrp4bpMF4Kr+zYbIx+rExEY5Usfr/Eo6sgkcHY6iXShuaQsH?=
 =?us-ascii?Q?Iz5JO3WNtms8kTxpNj2pA1kWXq8Na/bVIljfHjlE+hWt0q0sK/MN1YBs+sya?=
 =?us-ascii?Q?QBDdfs5LzScbdpzq1dBesM3mi4ki2T+gan+pRsbRhgRxOfdx5qZ/Et7TbXFF?=
 =?us-ascii?Q?gHIMdwKGlpo3HFv9D0Wl3XjSXO5RFp/0ll/LC/HPI0nznTrkbPEv3Pxh+twU?=
 =?us-ascii?Q?T7pZ2QKT3mVSzX6lyL0YRFwNJSMPBYhcHIijmfYwPa1vV7aLO95Mg1WWZxqw?=
 =?us-ascii?Q?u7cWgFf2NH3jMolyAw/rh8Xm9uzgN+rBhjnNtQ6lul5bzpTvjfFgKyjD5F18?=
 =?us-ascii?Q?7LCqjdeqDoi9GyB7f+0Arf9VK4Hx6z4B1iPU+zRG4ApbG9/AdTURnkttamkp?=
 =?us-ascii?Q?5CYMa4xJVCbeRrAW2uiaHDlFgNr6StKSXyXPHvKu2t0lsECrspD1VaL+4y7v?=
 =?us-ascii?Q?4Ke0J+zIeKNRBSAjf5gmeC60PBvvC85BOjXOBn8hmtKb/M+F5y91/319OiJ2?=
 =?us-ascii?Q?JWja85NKNt696exINJRUDLsz6TUq6HwhFiS031UnRqKGEkCpJ24s/Pfk18Bq?=
 =?us-ascii?Q?da2Vw6eDtKb9NB8AuG0X0vnyjAMcNyT4DQzEpMlEJn4/SaDu/K1Kv5yCBpnn?=
 =?us-ascii?Q?bG4zAZRx308QbsGU0mqXgbTOR2bkInmJ9QXTpMX5IzTdO6mzWJiVt/P40Xob?=
 =?us-ascii?Q?70gyoWJpd1CbxdzCqGhvwZy2D4plQh9+ygPeVDx/Nu1H4drv8lT/0TL8VPoq?=
 =?us-ascii?Q?PqohprJWDixZbkNwGvrUdH7AQxJAVh7O4r6YppqddlEDS8RApr/JS+YzyEmf?=
 =?us-ascii?Q?OeAu980NEw0i/j/rmoZ4ieabfvH0HrebhQmtFteonznrIPwSN49nUMhfRo9U?=
 =?us-ascii?Q?GySpsN6ixSkEcaWWwfIS93G59fjxlRQoAm9PJLB/LVxrYk+Vx5uJJnx3xbcZ?=
 =?us-ascii?Q?lEs0aQ/BaKq7iweRRN0VPVf/jVY/Hg5Ng3vpkDtXuevfx4CpA5LhCUOHAnHL?=
 =?us-ascii?Q?Pg1t8jmWsLNQUHJpmFEqoFIDM/tjhV7aasrX5zfPEXYy/arvwSoDRmVk1MkB?=
 =?us-ascii?Q?CsW17LCVNFVAY3paq3T1Qt1DyW1OduMXfms1J7oCGD/yWnChVhnQTFt7YeOY?=
 =?us-ascii?Q?9i9CEjt9RJBiMTMDAE7zumAkcWnvyAXIO6ApP4/HUn++cVtZeHBdPd9Iu2pw?=
 =?us-ascii?Q?Fy7uWIfTiJwPoCC28zLV+H0XgA6aLytf5IkJmakC5dd6xlKyEsE3TcRvoidY?=
 =?us-ascii?Q?0JgCgV4wiYRshXDIK5SbwxCp?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cc0b80-9266-46f7-fe1d-08d8e86dc34f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 11:22:20.0942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF9a1TE6lq/2Z3D7QBcWDgVzRtywZ4Ewn8zUObqPYpkNYWp0nOm5gdAADl+7VkTHxf+slVvkhZ+N1LX9lyXqpLe79UIusC69awloWJBFo4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2068
Message-ID-Hash: ZFX5NCNZTR7CRYG3Q4AHOFERKEJLVRYZ
X-Message-ID-Hash: ZFX5NCNZTR7CRYG3Q4AHOFERKEJLVRYZ
X-MailFrom: frieder.schrempf@kontron.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZFX5NCNZTR7CRYG3Q4AHOFERKEJLVRYZ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

NFC tags usually provide an unique identifier. Neard already checks
if one of the two types of identifiers is available, reads them from
tags and stores them in near_tag.nfcid or near_tag.iso15693_uid
respectively.

Though currently it is not possible for any client application to get
this information via the D-Bus interface as no property for the UID
is implemented.

This adds a 'Uid' property to the D-Bus interface for tags, which
exposes the UID of the tag as byte array. If nfcid is available this
is returned as UID, otherwise if iso15693_uid is available this is
returned. If no UID is available, no 'Uid' property is exposed.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes in v2:
* Add whitespaces after 'for' statements
* Add more details to the commit message
---
 src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 9eba4ee..d530893 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -53,6 +53,7 @@ struct near_tag {
 	uint8_t nfcid_len;
 
 	uint8_t iso15693_dsfid;
+	uint8_t iso15693_uid_len;
 	uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];
 
 	size_t data_length;
@@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
 	return type;
 }
 
+static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid)
+{
+	if (tag->nfcid_len) {
+		DBG("NFCID: ");
+		for (int i = 0; i < tag->nfcid_len; i++)
+			DBG("%x", tag->nfcid[i]);
+
+		*uid = tag->nfcid;
+
+		return tag->nfcid_len;
+	} else if (tag->iso15693_uid_len) {
+		DBG("ISO-UID: ");
+		for (int i = 0; i < tag->iso15693_uid_len; i++)
+			DBG("%x", tag->iso15693_uid[i]);
+
+		*uid = tag->iso15693_uid;
+
+		return tag->iso15693_uid_len;
+	}
+
+	return 0;
+}
+
 static const char *protocol_string(struct near_tag *tag)
 {
 	const char *protocol;
@@ -219,6 +243,30 @@ static gboolean property_get_type(const GDBusPropertyTable *property,
 	return TRUE;
 }
 
+static gboolean property_get_uid(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *user_data)
+{
+	struct near_tag *tag = user_data;
+	DBusMessageIter entry;
+	uint8_t *uid;
+	uint8_t len;
+
+	len = uid_array(tag, &uid);
+	if (!uid || !len)
+		return FALSE;
+
+	dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
+					 "{y}", &entry);
+
+	for (int i = 0; i < len; i++)
+		dbus_message_iter_append_basic(&entry, DBUS_TYPE_BYTE,
+					       (void *)&uid[i]);
+
+	dbus_message_iter_close_container(iter, &entry);
+
+	return TRUE;
+}
+
 static gboolean property_get_protocol(const GDBusPropertyTable *property,
 					DBusMessageIter *iter, void *user_data)
 {
@@ -526,6 +574,7 @@ static const GDBusPropertyTable tag_properties[] = {
 	{ "Protocol", "s", property_get_protocol },
 	{ "ReadOnly", "b", property_get_readonly },
 	{ "Adapter", "o", property_get_adapter },
+	{ "Uid", "ay", property_get_uid },
 
 	{ }
 };
@@ -671,8 +720,10 @@ static int tag_initialize(struct near_tag *tag,
 	if (nfcid_len && nfcid_len <= NFC_MAX_NFCID1_LEN) {
 		tag->nfcid_len = nfcid_len;
 		memcpy(tag->nfcid, nfcid, nfcid_len);
-	} else if (iso15693_uid_len) {
+	} else if (iso15693_uid_len &&
+		   iso15693_uid_len <= NFC_MAX_ISO15693_UID_LEN) {
 		tag->iso15693_dsfid = iso15693_dsfid;
+		tag->iso15693_uid_len = iso15693_uid_len;
 		memcpy(tag->iso15693_uid, iso15693_uid, iso15693_uid_len);
 	}
 
@@ -837,11 +888,11 @@ uint8_t *near_tag_get_iso15693_uid(uint32_t adapter_idx, uint32_t target_idx)
 	if (!tag)
 		goto fail;
 
-	iso15693_uid = g_try_malloc0(NFC_MAX_ISO15693_UID_LEN);
+	iso15693_uid = g_try_malloc0(tag->iso15693_uid_len);
 	if (!iso15693_uid)
 		goto fail;
 
-	memcpy(iso15693_uid, tag->iso15693_uid, NFC_MAX_ISO15693_UID_LEN);
+	memcpy(iso15693_uid, tag->iso15693_uid, tag->iso15693_uid_len);
 
 	return iso15693_uid;
 
-- 
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
