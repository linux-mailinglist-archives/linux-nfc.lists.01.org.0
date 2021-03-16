Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF133DCDE
	for <lists+linux-nfc@lfdr.de>; Tue, 16 Mar 2021 19:49:46 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 43D6B100EBB98;
	Tue, 16 Mar 2021 11:49:44 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=40.107.3.122; helo=eur03-am5-obe.outbound.protection.outlook.com; envelope-from=fabian.gottstein@philips.com; receiver=<UNKNOWN> 
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30122.outbound.protection.outlook.com [40.107.3.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 15D2D100EBB97
	for <linux-nfc@lists.01.org>; Tue, 16 Mar 2021 11:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahpBRwSMspspuklsujoh+CyJydxlCStxn7qgilGRuRlFPJL7wq1kT9kJtUSb0Ap3qH6vTiQlOZ6kLdeVle0ZI8OLya1vP6+eykKxAb+Atg9N4B6aZH0YfjLIZCeoDEHfpWRgDK3z5pqYmBlgREITLdyhK4M4nV6A3EHlX7LNzS8j8RYzNHlH/VW0+ryfmNT+ydwv/TylvFGgsBNT6Uwx66p1mV/tlRMtvt8h1lg4TOM5EItoVMJVXiiZDfJTfh9bkWV00qVEypR2OaS0SC3Hfz1Iz/UFM9ACwO58zhBe0NuLsVddcI+yxGv01zSk1MF4uEDnP7e6mWJknIiyDbJUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki9AG+EwskigAILoFrkG8g6P0YcpoaeLa1Uggkkh+O0=;
 b=J+lyi7HUuaj5ajmZN4Htf2pk0sOP5v6GNvcqBMIbwIaSd2dgN1aV8weq+YH8nyJj2uguUS8v3szJL4kz4UkYEgXyFdQFm768NGAD+LBsnGFbrjLYBhDED9YGqwRuhBeEcPWN0VpSjW1PcJXaCaI+WpCvnsgdTsqw2222GeW+l0MnuTcbstiKuwah1RCapKkI5ljJ3kMSKBYfVdXRVXvxlHYX5J+h/6aoc+6h0BhsRWiY9TjWNU9Ny9p14STJYoXl9tcwXv+BJDkGg1lhMCuvxxOn+2xtYYcJEHFQF+vILzn7vsKINBVXHL5sp8AkfmZAjW9IyixwAEbyA1+DIfJiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=philips.com; dmarc=pass action=none header.from=philips.com;
 dkim=pass header.d=philips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki9AG+EwskigAILoFrkG8g6P0YcpoaeLa1Uggkkh+O0=;
 b=JxxDwigKIXvdB9GI5NLLq8MSYGeHeWuNv722os/3Vn4OQsqylO2P43aXRp5zAcXoMylK4euAzTL/qDkys445qLsQ2Zgthji5Ay939A/XAPQYB+lENiU/mwdjhGiRqxIyk4e5XJjZ0cRocAG3vL+Y9+PYg0aYScfg4HBBuBFWDpY=
Received: from AM0P122MB0113.EURP122.PROD.OUTLOOK.COM (2603:10a6:208:9f::24)
 by AM0P122MB0114.EURP122.PROD.OUTLOOK.COM (2603:10a6:208:9f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 18:49:38 +0000
Received: from AM0P122MB0113.EURP122.PROD.OUTLOOK.COM
 ([fe80::6da6:e2db:1e46:13bd]) by AM0P122MB0113.EURP122.PROD.OUTLOOK.COM
 ([fe80::6da6:e2db:1e46:13bd%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 18:49:38 +0000
From: "Gottstein, Fabian" <fabian.gottstein@philips.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Thread-Topic: [linux-nfc] [PATCH v2] tag: Implement readout of tag UID via
 DBus interface
Thread-Index: AQHXGlamd4gx2YQsJki6Nhpj07yWWqqG8Wxg
Date: Tue, 16 Mar 2021 18:49:37 +0000
Message-ID: 
 <AM0P122MB011340CE87F73F55335D040C826B9@AM0P122MB0113.EURP122.PROD.OUTLOOK.COM>
References: <20210316112210.50100-1-frieder.schrempf@kontron.de>
In-Reply-To: <20210316112210.50100-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kontron.de; dkim=none (message not signed)
 header.d=none;kontron.de; dmarc=none action=none header.from=philips.com;
x-originating-ip: [5.146.192.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a73fbeb-ff57-404f-242a-08d8e8ac4039
x-ms-traffictypediagnostic: AM0P122MB0114:
x-microsoft-antispam-prvs: 
 <AM0P122MB01142818C6D07F47810B06C3826B9@AM0P122MB0114.EURP122.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vLQe13eIxjF2puIrGsoPpLPAW2KN8usKNYL4I0XZJcD7UJuuatmxXv/N0vtTMDRTWMTnLXeTnd2TMwprWhiSU9/BU0jtlwto2ueJLIKAbSZ7vrLxAAirr22itBtg++F9Ih9P4ovjsQJ78xqB2Ljd+5Gq+u1228UKqA5eg0y8ZganX+ydv2c4L/CYN+zkMM1CwlSEqc5iVZ8WnaSeCzLXeZSkoEea8K9W2Vh3hO+dbzlhBhYgQGzlHPlhsk2GgoBBAjzHyFe9CjrTkt4/Ax2unEYyKh/JPD/pOacHYVwbIL51Sr5xiBm9RdZ2VlqsSVhZPRKZHZxaLtW9mPtSM44S6fZitvaS3OeUDUtCcXvnmd+14tTkP8jhaga+xaqblDnbvulGHOLbH2lSRa5go74J7y1w/ZCZR+2xzVd2IeV51L0cTh4OWhJjDRysCXA/b8dSZRSK7XOgNzsQRMr3Y+jcgM2Hbigx+/EqUT/gWZ3yeRvr15JmsfmBwqGHiY6EaPkmmZoFlqzwsu0cbKY/X6bem0Jed+C6X1eGTyUdg4VmGAsZ9u5uH72ZaCEIO60Q4+fg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P122MB0113.EURP122.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(8676002)(54906003)(55016002)(71200400001)(9686003)(66574015)(86362001)(66476007)(5660300002)(7696005)(2906002)(53546011)(6916009)(52536014)(26005)(186003)(66556008)(66446008)(478600001)(64756008)(83380400001)(4326008)(33656002)(66946007)(6506007)(76116006)(316002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?QzwxwruEkTDRvnfr3UH7OMTnvVXnSFY/ERu7x3CEX9UmJxTaaDpyGAduWx?=
 =?iso-8859-1?Q?8LLFQbwMAYgsCwMtD2pWTXoLSN4bOsBeRYBUkv714evr3peqZGJJsvU8ml?=
 =?iso-8859-1?Q?94AXDPHu2VBMaoJ8TrfPSjNNeygql5envzwjXP6NHotvxo77j+GMeK9zVj?=
 =?iso-8859-1?Q?tyuLNzkXwL5vYMhP/0P5qzSkAfFz9FhQuavtpnao74EQ+9cp4w93xNEECW?=
 =?iso-8859-1?Q?dm49UpFRIfaQ0GlzFErbENZoZ8X9dUAP1QEDOSZ5kIKUZDLfaETx/6KN/V?=
 =?iso-8859-1?Q?vSzEErh440akzVwateawOyAHWZ5gNoph3WhkZ2gUm4mERuZdsOz4G5i3QC?=
 =?iso-8859-1?Q?JdbuPb3dXCito/RiqIdXcXTJ1FVGJ+4/WNIRjEOZj0qn7wocr7mk1+7Itc?=
 =?iso-8859-1?Q?YmHmqvhp/gWBCoUPFAiMMIMZr2pqEylRxlUXUyq2OBJshRRFbl2AGUKxe+?=
 =?iso-8859-1?Q?EUJiocxyxyqvZu82VEmua+FOfKDzJOPaFqPeDk77vcg5ScCUpBjExz+uxR?=
 =?iso-8859-1?Q?UsGD8vTFXmlEp13YlOV6ueTxf4l5PjNYzIDRuYju87LNuxnOYXF5uFzYYy?=
 =?iso-8859-1?Q?J57KtmuuOeDQWCYl+hRIFQWvuCeEWFYpfTFIVP0BAqlmdGJkTNjPrNP+wb?=
 =?iso-8859-1?Q?e4Guo1XDq4Fg8uTlqCwWX610V1aDUJN/vIONf67uNjvNaG+2yLs1IxIm4c?=
 =?iso-8859-1?Q?+ioux1+9PtPFvCEMdrVTDehJ5S+lAzDROYJzivCJGCElaGqRvKrV2/Fc2T?=
 =?iso-8859-1?Q?5vr7KOkkGCy8BWh3FSKsMIn6OISrBmjl+076s3qY3YPULmfLOpV54pv3KP?=
 =?iso-8859-1?Q?r9H38ESEnGj0o2AGM2KKQklT+yRnbuPrYYtwa1aFv/RB8QceiWItWQR8Dt?=
 =?iso-8859-1?Q?sDzzbqK8UY984iC403lcJhSZakXdHD6BahSyNKB+opBu4+IsuB2nDIbvUP?=
 =?iso-8859-1?Q?sWlepuFxxSpcxVoyfiU23KyQ0qK+Xu1g4VXqbp03bJdDkB1aDkuNByidb2?=
 =?iso-8859-1?Q?VgyViAq98oDSe9UCWmbSMTWobwkc/cPwrVwlgl0OaiztjqmZBo0KqWZbEx?=
 =?iso-8859-1?Q?ByGYrThjDTx+pIohmOfCNAux1L+bAQqSNm1kqLhuPrzVEM0GFM6Qz0zaLC?=
 =?iso-8859-1?Q?+vZEBZtI+bKKfEKcNnObOtCVmttTNSBHytt+u++0NZEzf53AzW9VUv3lOY?=
 =?iso-8859-1?Q?Hxqt48xfhrBC04vegf+Wpb1be4yNjbk3eg7s7DcJiCWuZzY1G28R1YDlCM?=
 =?iso-8859-1?Q?DjxQe5eWwhpeYGISGV9lCFrW6vClHCNpFbwepR6VykguogWoMSLR0ujIvn?=
 =?iso-8859-1?Q?ah1B+vOZNJocXCZbSiv58XJt0MyPlEAFrk1Kq7CDCONh5hD6Hg2cGSgRBv?=
 =?iso-8859-1?Q?vrybouv5Zy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P122MB0113.EURP122.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a73fbeb-ff57-404f-242a-08d8e8ac4039
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 18:49:38.1281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0dQkWTOBN6xL+HE+dvI4IWnAUXf1qj1jnmdIsdOnecJyP4r4IErtfTHDV5/TobLxK1v3T0xzVDfXZSXgGTuIR3FW79SFz3Uhgi0Cl6Y6dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P122MB0114
Message-ID-Hash: K5QE6T4HTYVV5CSY7B4VRIXU36INJFPE
X-Message-ID-Hash: K5QE6T4HTYVV5CSY7B4VRIXU36INJFPE
X-MailFrom: fabian.gottstein@philips.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] tag: Implement readout of tag UID via DBus interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/LI4WHNEWNSIUUI2R6C7JSTO52RL3XAMV/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Transfer-Encoding: quoted-printable

Hi Frieder,

thanks for the patch.

Could you please also consider the following situation:
In the case of a NFC Tag Type 1, the identifier is delivered via the RID co=
mmand (see NFC Digital Protocol). Thus, the Tag's nfcid property is updated=
 in a later step.
To inform the neard users, a property changed signal has to be emitted when=
 nfcid has changed (in near_tag_set_nfcid). Also, a exists() handler for th=
e new DBus property should be implemented.

Another thing regarding building the response message:
The following code snippet could simplify and improve the readability of th=
e usage of the dbus message builder:

dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, DBUS_TYPE_BYTE_AS_S=
TRING, &entry);
dbus_message_iter_append_fixed_array(&entry, DBUS_TYPE_BYTE, &uid, len);
dbus_message_iter_close_container(iter, &entry);


Best Regards
Fabian


-----Original Message-----
From: Schrempf Frieder <frieder.schrempf@kontron.de>
Sent: Dienstag, 16. M=E4rz 2021 12:22
To: Samuel Ortiz <sameo@linux.intel.com>; linux-nfc@lists.01.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [linux-nfc] [PATCH v2] tag: Implement readout of tag UID via DBus =
interface

Caution: This e-mail originated from outside of Philips, be careful for phi=
shing.


From: Frieder Schrempf <frieder.schrempf@kontron.de>

NFC tags usually provide an unique identifier. Neard already checks if one =
of the two types of identifiers is available, reads them from tags and stor=
es them in near_tag.nfcid or near_tag.iso15693_uid respectively.

Though currently it is not possible for any client application to get this =
information via the D-Bus interface as no property for the UID is implement=
ed.

This adds a 'Uid' property to the D-Bus interface for tags, which exposes t=
he UID of the tag as byte array. If nfcid is available this is returned as =
UID, otherwise if iso15693_uid is available this is returned. If no UID is =
available, no 'Uid' property is exposed.

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
+       uint8_t iso15693_uid_len;
        uint8_t iso15693_uid[NFC_MAX_ISO15693_UID_LEN];

        size_t data_length;
@@ -168,6 +169,29 @@ static const char *type_string(struct near_tag *tag)
        return type;
 }

+static const uint8_t uid_array(struct near_tag *tag, uint8_t **uid) {
+       if (tag->nfcid_len) {
+               DBG("NFCID: ");
+               for (int i =3D 0; i < tag->nfcid_len; i++)
+                       DBG("%x", tag->nfcid[i]);
+
+               *uid =3D tag->nfcid;
+
+               return tag->nfcid_len;
+       } else if (tag->iso15693_uid_len) {
+               DBG("ISO-UID: ");
+               for (int i =3D 0; i < tag->iso15693_uid_len; i++)
+                       DBG("%x", tag->iso15693_uid[i]);
+
+               *uid =3D tag->iso15693_uid;
+
+               return tag->iso15693_uid_len;
+       }
+
+       return 0;
+}
+
 static const char *protocol_string(struct near_tag *tag)  {
        const char *protocol;
@@ -219,6 +243,30 @@ static gboolean property_get_type(const GDBusPropertyT=
able *property,
        return TRUE;
 }

+static gboolean property_get_uid(const GDBusPropertyTable *property,
+                                       DBusMessageIter *iter, void
+*user_data) {
+       struct near_tag *tag =3D user_data;
+       DBusMessageIter entry;
+       uint8_t *uid;
+       uint8_t len;
+
+       len =3D uid_array(tag, &uid);
+       if (!uid || !len)
+               return FALSE;
+
+       dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
+                                        "{y}", &entry);
+
+       for (int i =3D 0; i < len; i++)
+               dbus_message_iter_append_basic(&entry, DBUS_TYPE_BYTE,
+                                              (void *)&uid[i]);
+
+       dbus_message_iter_close_container(iter, &entry);
+
+       return TRUE;
+}
+
 static gboolean property_get_protocol(const GDBusPropertyTable *property,
                                        DBusMessageIter *iter, void *user_d=
ata)  { @@ -526,6 +574,7 @@ static const GDBusPropertyTable tag_properties[=
] =3D {
        { "Protocol", "s", property_get_protocol },
        { "ReadOnly", "b", property_get_readonly },
        { "Adapter", "o", property_get_adapter },
+       { "Uid", "ay", property_get_uid },

        { }
 };
@@ -671,8 +720,10 @@ static int tag_initialize(struct near_tag *tag,
        if (nfcid_len && nfcid_len <=3D NFC_MAX_NFCID1_LEN) {
                tag->nfcid_len =3D nfcid_len;
                memcpy(tag->nfcid, nfcid, nfcid_len);
-       } else if (iso15693_uid_len) {
+       } else if (iso15693_uid_len &&
+                  iso15693_uid_len <=3D NFC_MAX_ISO15693_UID_LEN) {
                tag->iso15693_dsfid =3D iso15693_dsfid;
+               tag->iso15693_uid_len =3D iso15693_uid_len;
                memcpy(tag->iso15693_uid, iso15693_uid, iso15693_uid_len);
        }

@@ -837,11 +888,11 @@ uint8_t *near_tag_get_iso15693_uid(uint32_t adapter_i=
dx, uint32_t target_idx)
        if (!tag)
                goto fail;

-       iso15693_uid =3D g_try_malloc0(NFC_MAX_ISO15693_UID_LEN);
+       iso15693_uid =3D g_try_malloc0(tag->iso15693_uid_len);
        if (!iso15693_uid)
                goto fail;

-       memcpy(iso15693_uid, tag->iso15693_uid, NFC_MAX_ISO15693_UID_LEN);
+       memcpy(iso15693_uid, tag->iso15693_uid, tag->iso15693_uid_len);

        return iso15693_uid;

--
2.25.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org To unsubscribe send an ema=
il to linux-nfc-leave@lists.01.org %(web_page_url)slistinfo%(cgiext)s/%(_in=
ternal_name)s

________________________________
The information contained in this message may be confidential and legally p=
rotected under applicable law. The message is intended solely for the addre=
ssee(s). If you are not the intended recipient, you are hereby notified tha=
t any use, forwarding, dissemination, or reproduction of this message is st=
rictly prohibited and may be unlawful. If you are not the intended recipien=
t, please contact the sender by return e-mail and destroy all copies of the=
 original message.
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
