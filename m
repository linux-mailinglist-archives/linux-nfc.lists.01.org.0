Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E63C836D
	for <lists+linux-nfc@lfdr.de>; Wed, 14 Jul 2021 13:05:51 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 797D2100F225F;
	Wed, 14 Jul 2021 04:05:45 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1079B100F2274
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:43 -0700 (PDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E8C0F4054A
	for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626260741;
	bh=gfJcgDCX+yAnsOmN2G5ktVr4v63WiwBSiQqR8GkFXMU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=U5EDrWsHO39rmsLr/EzePjlfGLMbHtCAdTVeyzS5Q4jyQx/iSrs60rICuNY1r2acV
	 xCe9vQOBawnbDWFIqHNelS8bmYUMs1Z+q/aEqHgclZsV8DcJa1WKPWu5RnxbzyYrmQ
	 o+Q5HV6bEsBLAy2JjWnG7KJupxn1DC25DUVof1clhqMR01ZU3eefF4roww6qWidc6u
	 KmMMLEVjnB3ow7tE143+lExNL+ihhF4o39m5/lkAqJtAQa42Pw74tFCK5vfzkMiRz/
	 XHk7eUERghX85/D2BToUJhebge8wva3wJ9H8CYQjUhhcdAM6vKEc2LTQYXVVm+qP8b
	 LBU1Vz2Cup2Hw==
Received: by mail-ed1-f70.google.com with SMTP id m21-20020a50ef150000b029039c013d5b80so1064182eds.7
        for <linux-nfc@lists.01.org>; Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfJcgDCX+yAnsOmN2G5ktVr4v63WiwBSiQqR8GkFXMU=;
        b=lsfCDhBW3RuM85NnB2j0wwN4XuAaOPwz9wHGDGGZxBsgIv1xV/E6V5AFfKgVNrdwmJ
         GPChLXbiFpeHLSBtDs2ElXnozcdwfE2GcwqCfMSpJRD8XC+ZXU8AS1Ehk46y1csuARVv
         zpiHISgs9PJnNWQ6I7u8a6z+ZfuAUSPo0RFLipVESpRLUT1XiRWusrX00qYy+gtNcoVf
         6jJfd/IHVKlOqu5Pq/nRUdjltyfPuZYhsYi+M9vnETeFpGbvACjAw7TEPcmPfnUCzluq
         ZsgjPRMkHDA7gL4xwA2Cet9mrpfyPD+G/nCpoJYA8qjjd+hKtwbYsRSQKzvl+RS3lKcB
         NiUg==
X-Gm-Message-State: AOAM532/7qYq+ugerLhbrvKhPEPKltdrM3Wh3/vpu6STeN8aWHUaX8x7
	RzP4rF357UgQ2TZk+DaMducDkFGPjjGGoFRdSBM6uLublQCF4g2zvtl8OuSVpnSrvZjDHAAhcsS
	rRO1cAZuSp9mywUBDP924+LE7Ijpk3GEjPw==
X-Received: by 2002:a05:6402:895:: with SMTP id e21mr12633288edy.9.1626260741528;
        Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyENJp3HvIrIUJD3gJJjO+1sNB9aNSzyigdRwfqQwfJCniVZGaujCJSiitb2TqxljwW9310OA==
X-Received: by 2002:a05:6402:895:: with SMTP id e21mr12633269edy.9.1626260741412;
        Wed, 14 Jul 2021 04:05:41 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id qp12sm637689ejb.90.2021.07.14.04.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:05:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Date: Wed, 14 Jul 2021 13:05:14 +0200
Message-Id: <20210714110518.104655-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
References: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: ZZBREDGMYJZLEVKPTDU2EQGHRKBBVDRA
X-Message-ID-Hash: ZZBREDGMYJZLEVKPTDU2EQGHRKBBVDRA
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard][PATCH 12/16] snep-send: fix near_ndef_message memory leak
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ZZBREDGMYJZLEVKPTDU2EQGHRKBBVDRA/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The result of near_ndef_prepare_text_record() should be freed, otherwise
it leaks making ASAN and valgrind unhappy.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/snep-send.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/snep-send.c b/tools/snep-send.c
index 5bb153210d30..53f53250b1ae 100644
--- a/tools/snep-send.c
+++ b/tools/snep-send.c
@@ -91,6 +91,7 @@ int main(int argc, char *argv[])
 	frame = g_try_malloc0(frame_length);
 	if (!frame) {
 		close(fd);
+		near_ndef_msg_free(ndef);
 		near_error("Could not allocate SNEP frame");
 		return -1;
 	}
@@ -100,6 +101,7 @@ int main(int argc, char *argv[])
 	frame->length = GUINT_TO_BE(ndef->length);
 
 	memcpy(frame->ndef, ndef->data, ndef->length);
+	near_ndef_msg_free(ndef);
 
 	len = send(fd, (uint8_t *)frame, frame_length, 0);
 	if (len < 0) {
-- 
2.27.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
