Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C6336E3B
	for <lists+linux-nfc@lfdr.de>; Thu, 11 Mar 2021 09:51:19 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 565B2100F2268;
	Thu, 11 Mar 2021 00:51:17 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.7.113; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frieder.schrempf@kontron.de; receiver=<UNKNOWN> 
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70113.outbound.protection.outlook.com [40.107.7.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 051D2100F2262
	for <linux-nfc@lists.01.org>; Thu, 11 Mar 2021 00:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXYujs890FRe2ZKT+4nnonLEaFN1pTJJgwQBonDO/El25mQMw/NymkHPNBzlY3ET0W49lnQiFFSqiqntRFX28ooErfRF054iym/ZjpIpDmZEqX0pUOF9fi88rTj//KiOOQcG3KrqB5h2+cYWvX2odENP+AmSJz0wMG+fIjJ73+O6wMT+ggu6RtYlNQQpJhYLZXkl1hn0cCP0tbHqlp/YSKyghDDe4JiQzXyPYGHcI763DirfDJ6d8PvQzcySIMaLOyiGbavMaetpPAQoOCMpvKmHK9RPw16oYHN0bX27/UctCxmPYAqSOWZ3Xb1iVXVVgjCj/QAN+Y2TaRlCTK1N5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spzi9cYSjcyWNMkMwZ5J9uWJ9s0sDRNAs+u9vPO6M2I=;
 b=ZcrXibFEwkn8Q/FQSNe1C0sS4sLpZfysaA8wwzbzfbUXsZAG9sP/jBiI0a8mnlTV5tw/+JBwWU53/N6MECMsuZz0YFFDQKbuyxgi9s+mdfMLrwsUGehxObW0fH78CYDKgMpomhHTA6s/X56tKVJJAwKHLM1L6ELNnNNnwfM/NS9Y/c82+HcnEj5yGR3bYiQAc2kvwbZt3Q4Md7E/cGdcXeWyDknMhtvp5bRY6U2o57rL7Qlm9DoDmlMcLVOzUHHQaisOuux0D7k/tFUk5DimH1NVZnQ8VTyZPklkqlTwDjLqHHco6Bws7RNrS5ZpWnIxpPkH7HiQ7pX4W0hGJWYP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spzi9cYSjcyWNMkMwZ5J9uWJ9s0sDRNAs+u9vPO6M2I=;
 b=Jsm6iZJYsj5Gpat8ELFs458x8FIMaXratPnK1TOwwMiE2ammVbaOn04QX/7ajjCUByxKQsOIs4ZC4Oj0xBuDEZVcSII4U3vkIKR8ePyBcIepZmmF1f5JzCONBQ/iJVBU4XJK//0a5I8gOauaZ0NenfTsk8Zj5X1Mqz0jOtdWn9w=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 08:51:02 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::213d:da89:973e:7fa1]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::213d:da89:973e:7fa1%6]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 08:51:02 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Samuel Ortiz <sameo@linux.intel.com>,
	linux-nfc@lists.01.org
Date: Thu, 11 Mar 2021 09:50:20 +0100
Message-Id: <20210311085020.429987-1-frieder.schrempf@kontron.de>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [88.130.71.217]
X-ClientProxiedBy: AM0PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:208:154::27) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fs-work.localdomain (88.130.71.217) by AM0PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:208:154::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 08:51:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbb19b36-07d0-4bf4-7ece-08d8e46acc40
X-MS-TrafficTypeDiagnostic: AM0PR10MB3169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB3169635C460BE541A809A17EE9909@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhKi60OF4gLb81ilVwSyqoCpwwIOmNl46/tP82rPtzmymR0JM92KpjU/CZw+TyAV6RcE5yBQqS+KlNOOXcnctM0ZueD9ctvaD/dYgnNwvW8hi245I1392kOMFpkzNTqTHAv4Ube5AX6nkPk3wqo6qo6LyJZtdxFY+023fZB9t1i6DyW6sqU+LZqsixZcGhLINSF00RZ1I5EkfNP0DQoDdIdaX/i3TT8XOqE4QdVcNtcL5zRn1CIlKKTbtzTpUuacV8Uirnli74M38VKXOiIRiV2Y9Pp0uoALeZqkQ8StUhUIpQTJ3NLwNh6kpDPU7WLABMNHczCzAzxPFCe4lFKUElw9eyUO79kYOyFSnFFboB8Xnr82q9jrTvLiDg1v5Sqr4kTN168JpY8+muWCGLM5f5NNVDYcbcJMnKmnchSr+DqdHU1HmFFKlfzny1rySiwMKOzlyoB3VRyzm9bjHVE3kphPHZ+hVUn2yZQwjZYP4Wyriv0+Apy0y1NGwtq8HX2B0yJ/DVF/sAVq1+vPSIuOtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(1076003)(66556008)(8676002)(478600001)(66476007)(66946007)(6666004)(5660300002)(2906002)(83380400001)(36756003)(8936002)(2616005)(6512007)(26005)(4326008)(107886003)(186003)(86362001)(16526019)(956004)(52116002)(316002)(54906003)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?t2trdbxVVgIX4gpMfH8aopzRYs4/AgXBMZEOQ/8CfST5BuhGsp/gZFU/L0Lf?=
 =?us-ascii?Q?j3X6XinvI4I8iBdQ0hnTPonXPvMS53EZzmsacSGTAAyb7TaT6uL38X3ea7dy?=
 =?us-ascii?Q?i3XC96TSJsWVVZbyxu3x8DWwq/+zj1d3kL66YKAJfbjLJQ7Cfwa89B1KZuIA?=
 =?us-ascii?Q?GtNQYgpvfm75DMm2ZVkOcD807FaG9MA6NJx4cv4ZtdA1Jnkfl773Mu6NwVwu?=
 =?us-ascii?Q?gttK+U/mzFriu8VtCbtx5XQOoAEYCkUYY6fNdU14PLnjXTTOHnQoEzditPBU?=
 =?us-ascii?Q?U8Eypn+TijmtnZwI+xgY3i0doroyxX0HOckdMk6+WaBvo1YnAA++VBnYIVAG?=
 =?us-ascii?Q?Vs1PemQCihqWJZJGSlePlPazrPpzvLQyBursejq4m7OWqCwi3psjDMZatV38?=
 =?us-ascii?Q?oGoFJI16HDSP7qsHY7pTjnJk2l5VIR3yC1QSXErKQ+2pC30+fgbfcis6hOG+?=
 =?us-ascii?Q?mikgs/QUP1O2xVtgU+xDU5mvESFrXOFD5RYIc7TSQmYdqhy1gG+xigFdO2cN?=
 =?us-ascii?Q?JT/e+oTjRqRIVpe2Mbnkg+SdUfDyb/nPBC4NwCRY0l44ITk52hs31A4E+xs2?=
 =?us-ascii?Q?U/d0fxSevZ2txYMOucrPrb657Y3OAWobyoRau0XnPypQiouD4rSWQvs/XeKL?=
 =?us-ascii?Q?OHr6W3574ic0+KJod8OEO9zDU1RBnAm9+tpwYgsqPACKorZWEZ9chVFHOwrq?=
 =?us-ascii?Q?ep9UQ7qXN1S77XMDmranshXkFdV2FPVR3fkC4BYZH16mHZYjHOX7iNx4OUPv?=
 =?us-ascii?Q?dnJkygm7nmDjqiyzxTGnNzw8BdSWOsAA0QYHGAmmRrzcHk4eY4GhSFesxy8q?=
 =?us-ascii?Q?f75tgjQTtKzw5e3qn8CujpRFWbz4D1n9Xis9ga29+lM3u5rI+DXjl/yD5zpV?=
 =?us-ascii?Q?3yVmA41Z3OIhVw5I+SjssfskxtFimkp6wzQtLslvMoBKAN+QucK75FsshZfm?=
 =?us-ascii?Q?yXIADrvzLxJWqiSFBIht/r2oGm+LATnxnRAvoayKvT/qugJSNzuS2pkWbSxJ?=
 =?us-ascii?Q?2VbcqikF9UucHzPO2/jaIj3OMWHBvRYua6170JCWXbfzKaWKF86icC3Tq9vQ?=
 =?us-ascii?Q?MPstRWfPHf3w4p8PQO7w2i2bO6k1flmSJsakWgJdZeS7g1dwHGzLYGYpigNa?=
 =?us-ascii?Q?TiAAWmZucLD9TQu7yuf8frd6Z92XPvYc9WaUecWCp/heOSJVQhnjCOyCWbgU?=
 =?us-ascii?Q?CQ3OfGJWmV7SdHPrU6wVCwknaIpnn1Asyrr8q/O4Zoualc4Dsp3RqrdwsHDi?=
 =?us-ascii?Q?OJKwNlNeWrmmxDGhQpJIinVIOSeHJqGnYc4zI8nymp9OLGg5jgJEUnSqgARq?=
 =?us-ascii?Q?9/ZlqUueLBLBfY3nqPlIVhEL?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb19b36-07d0-4bf4-7ece-08d8e46acc40
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:51:02.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYSDbJUwtyOvAtZG15HA9sZrhRK0GbiLOUB19s8OGwlr8nFDjiECzLf51E9KoaY5w8AWxsdOg5PNDDaFEuicgPqEQT1S90buNZRKvaIhz6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3169
Message-ID-Hash: OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK
X-Message-ID-Hash: OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK
X-MailFrom: frieder.schrempf@kontron.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OHD5IQHYPFUPUFYWDMNSVCBNO24M45VK/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This adds a 'Uid' property to the DBus interface for tags, which
returns the UID of the tag as byte array.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 src/tag.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 9eba4ee..2039e48 100644
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
+		for(int i = 0; i < tag->nfcid_len; i++)
+			DBG("%x", tag->nfcid[i]);
+
+		*uid = tag->nfcid;
+
+		return tag->nfcid_len;
+	} else if (tag->iso15693_uid_len) {
+		DBG("ISO-UID: ");
+		for(int i = 0; i < tag->iso15693_uid_len; i++)
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
