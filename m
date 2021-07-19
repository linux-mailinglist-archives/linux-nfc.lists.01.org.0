Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B43CD326
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:09:25 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 01EF7100EB33C;
	Mon, 19 Jul 2021 04:09:24 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 7910C100EB345
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:22 -0700 (PDT)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 7564B408B5
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626692961;
	bh=+YekN90xf6jsCpj8MSNQjVrLqPvlJAwS81y66JBOVXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ndS5BKuweLaJezEcyraBNQhzVPvkejaCnQxHmGBTP7vTIQPzSfsafoxDg65ainEBu
	 tZ5Nm+DpAIQK5tJ0I4Dj7N9x7o1ra1xR/AN3TPaWVKQkeqlzWxHhz9VGXKljZsV3DD
	 jAHutHFygdvemdaMwZusykaAeVDcjjF0FVp/DAJw3XybSa9OkmuxJpxBFmikr8MRnK
	 DwVuaMIJ0mB92MzGNBYbAYiJwlygi3bF9MELT2tE3+LIB9aB+TTxVgyveVBA1v4rVY
	 50aBw4UVc1HHPm0PsCNfKDjJCjGH5Cph3q2gsmOQbCFLThkLPbnfJbSNR6dghlAxB2
	 HV7HAY2O/Z6Kg==
Received: by mail-lf1-f69.google.com with SMTP id b18-20020a0565123052b029037d602924c2so3250633lfb.17
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YekN90xf6jsCpj8MSNQjVrLqPvlJAwS81y66JBOVXU=;
        b=uGWAkUK39gPUKj68ZNio2M4bm5NLNElma//IiU3rBnLnfvKg2KZ6sYozaxJp6tbJwf
         yw/vHVcaVhRVIkpXiOIT1iwu2JMcJSa7y4BJ1lUcgYeoen3FB7Ep5BXU/m8oOCLD/uak
         p2qO5KRb70XQIKTEIJsHHkCm9yVhR7Xv6telozI2AdL2Woc1scfXWjX4H9nctwtfcZy/
         PlFRpZFXmuHB0nNI8TYbumOXEJOC9jkhkFAKps6Z0kx8qNsWB1fRPkrDC5ePLGdz5GYu
         0B97DPr+3TyglwMCA8gmTpqLrgiPTmugvauYZ/0gNjDnRb8VXj2/4SZvvg78x/nRowYG
         E3dA==
X-Gm-Message-State: AOAM531Oxge+2JreynlPkuTRlVktWEztK6+dtFvOhNB37SQK2W9SnpXE
	eZM+KisW+pg+NBtY7VkK5z4iOfpbthdW/qaGHg6fiKYsXHcb5fqyymGWFtwHidwt+sUIHkHTAwh
	T3lw6Wk9E37fMktwcA5W8uH7H1/9g3+eBXQ==
X-Received: by 2002:a2e:a315:: with SMTP id l21mr17232562lje.359.1626692960745;
        Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydYSsaMJ2ddPTSn1Ewatc1K6H2R4nUozXg5BOYfxu09NLNwCRMp6VAaN+2kl6n062QEzCiDg==
X-Received: by 2002:a2e:a315:: with SMTP id l21mr17232552lje.359.1626692960627;
        Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:07:46 +0200
Message-Id: <20210719110819.27340-41-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: UFNUVLWJVDY4R4HEQZCG55FII22BU6VD
X-Message-ID-Hash: UFNUVLWJVDY4R4HEQZCG55FII22BU6VD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 40/73] tag: do not open-code freeing ndef message
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/UFNUVLWJVDY4R4HEQZCG55FII22BU6VD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/tag.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 520368b1552c..ce8c477d9527 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -459,14 +459,12 @@ static DBusMessage *write_ndef(DBusConnection *conn,
 		break;
 
 	default:
-		g_free(ndef->data);
-		g_free(ndef);
+		near_ndef_msg_free(ndef);
 
 		return __near_error_failed(msg, EOPNOTSUPP);
 	}
 
-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 
 	tag->write_ndef = ndef_with_header;
 	err = __near_tag_write(tag, ndef_with_header, write_cb);
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
