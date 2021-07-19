Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ADF3CD349
	for <lists+linux-nfc@lfdr.de>; Mon, 19 Jul 2021 13:10:06 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 95918100EAB5F;
	Mon, 19 Jul 2021 04:10:04 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id AE944100EAB47
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:10:02 -0700 (PDT)
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C2E6F409F6
	for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626693001;
	bh=fzX3ov5Ta9OPd3PIiOlTSfmYDkmegofa5F9wswYFZcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=S+8kijqpvS2iFXt9daLvclNcQ8x/xMHpcAxf5Tm+T6Wrx/PKdr36N6BgWcCqvG30p
	 2USJ05acZNhs9BPBh5WlTjjLuX6ulXxJqtg4qYP7IAX7wWILLBTFFFZ+0gNuQSCpKm
	 mQILmdIjbfCBGXXND+NvavDD/IvDCmPL3NDLMLBdMCB3k1as9wc3XUdxc3x90j+Isj
	 k1wIRZstI6rjRJusy/7SMU9qJ7RqU4fj77QnhzqMdEXitW/I8y7Vuu0ETCISGSdPun
	 sStyaanNIX2mVahTjcvAYofOj+4EJ9yw951fwoPdrJFycNMYCdgEo2rqWnX+cyLWpb
	 9JRiv9o+W/+nA==
Received: by mail-lj1-f197.google.com with SMTP id b43-20020a05651c0b2bb0290199022fba24so543169ljr.13
        for <linux-nfc@lists.01.org>; Mon, 19 Jul 2021 04:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzX3ov5Ta9OPd3PIiOlTSfmYDkmegofa5F9wswYFZcE=;
        b=PJ+vqIGrLKuFKg5y2v/7Sj1kUBbxkGQmd9S7oVVBQoYePpxH+K+IphsCyLaf/PKA4f
         0Ynh3RXZDY20RPi2+kLMuas2ThBlxQkVIFrhJCQJoEZTBW6qyWmKYfjZ9NraCcLy/zN7
         3HmvnWbSW2JWwYmO8aq+1nVRXY7MUL3djn++1aNFuJ1zFEJncqoFLtCyYUFzLUF59uoS
         tMiECbM7FZur6uwdXFu7S+tOO4uRKEcO5YbjK1lQVWsRwxebifOWoFgEs53SvLgqDswO
         GNxvGfW7bMJg4OK5ZPEuRUblrlQJzNCQNpX+wUeM2kWtZdnDmVdMxfK/X5djds/Av2ty
         TNJw==
X-Gm-Message-State: AOAM530S86czf5qyFmJFnchjGl/D0Y+rW3BuIZciKHVuUG+DvctuU+qO
	6iUnOWbhSf7D15BkAuxgzhobgSoArDUTg9bU3BN4SyXrOvOR2hHTA6kHGVinRROG3CURElwVlI5
	9oMsJgiO2jCbDY/BWJ8gAajr6hiTBWKWv2g==
X-Received: by 2002:a2e:309:: with SMTP id 9mr22082172ljd.82.1626693000876;
        Mon, 19 Jul 2021 04:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg0dgu648UFixRwYfCZtkb/X2Lov6UGexj27/rIlW368uzIw2BzOM4kHUbxImeOPTUm8MI0g==
X-Received: by 2002:a2e:309:: with SMTP id 9mr22082164ljd.82.1626693000709;
        Mon, 19 Jul 2021 04:10:00 -0700 (PDT)
Received: from localhost.localdomain (m193-217-114-158.cust.tele2.hr. [193.217.114.158])
        by smtp.gmail.com with ESMTPSA id z25sm1264701lfh.283.2021.07.19.04.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 04:09:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Mon, 19 Jul 2021 13:08:19 +0200
Message-Id: <20210719110819.27340-74-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
References: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: O2E2GVQOBCXGZYMQFY475SDESPDBPGBI
X-Message-ID-Hash: O2E2GVQOBCXGZYMQFY475SDESPDBPGBI
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH v2 73/73] AUTHORS: Mention Krzysztof Kozlowski's contributions
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/O2E2GVQOBCXGZYMQFY475SDESPDBPGBI/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 AUTHORS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/AUTHORS b/AUTHORS
index 7b60db5e1755..ff8b64624207 100644
--- a/AUTHORS
+++ b/AUTHORS
@@ -22,3 +22,4 @@ Mark A. Greer <mgreer@animalcreek.com>
 Arron Wang <arron.wang@intel.com>
 Vincent Cuissard <cuissard@marvell.com>
 Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
+Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> <krzk@kernel.org>
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
