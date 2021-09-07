Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B23402858
	for <lists+linux-nfc@lfdr.de>; Tue,  7 Sep 2021 14:18:31 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id D8649100EBB97;
	Tue,  7 Sep 2021 05:18:29 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id E1B92100EBB6E
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 05:18:25 -0700 (PDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DABCF40793
	for <linux-nfc@lists.01.org>; Tue,  7 Sep 2021 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1631017104;
	bh=ygx+SrZOuhDRvL55hE9xxzLOd3db853TUebx3pnrgoQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=jyUbkNv7nILzyveTW7jxCZgSs1rmx3R2NggqiL9rX23ZlrjOC7qGYwo/Z6Pl+9bXQ
	 tY7dz1GeYGgl0Vd0IEAuuSzQPQxIRHoXsNDXy8QLlZcu1eCMOKRRjuN8AK+yvcSboU
	 Nn/tFodei3Qi1jtn6JunhDAWaI//CRW32IT9vhGwHjffOD2ZEdVXVOOx2PvZTh8Ydg
	 lPiA6b00V28yMRED0VYTvk9mW0rsb5ld/FMBKZsdby5wNjSci6vWmbGz5uaPb70dLb
	 uR1YhGwze5n0qDdsw2BtTucZBcpTkz2aio/8L/agf2RgEP3GDDTGBm6/Dp2Qt/mMdx
	 xNIROWBFIGfiw==
Received: by mail-wm1-f69.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso1131601wmx.0
        for <linux-nfc@lists.01.org>; Tue, 07 Sep 2021 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ygx+SrZOuhDRvL55hE9xxzLOd3db853TUebx3pnrgoQ=;
        b=U6MZjPjT+QNQ8Buo+uQvvm8R9MDW5Tu1qJ05zVO4JrDVR5GJWhpC4RgngHcPT7Nb9B
         VzlEU45yHaqBZ8wve6gKinmtLK99nKQEr/MNENwZw8i7XKXCtV/t7e3N2uqTqsofWmxn
         VOfY6/VefbYpIOOCJeWwH1wcS7uBUt+tW/LJuFcU51kq9M7I4r0EXrNILiY2EdolwYA+
         g9w/eK8fPy2ehrXlibkpOKZ3kSbdXnq/H6yaskiH214FEXPBIu8AvlkDmz9MoBJQ6TO6
         8z7bOaTcKC9Gkk5OQYdhqn2OhrAkgrbdm74riPzz9TlL3p9lzZcmUG2aNdvls3ZOxIea
         +6Tg==
X-Gm-Message-State: AOAM532n50T66ThVgA36XEwhILC/M/hNsSY3niHHswaRVkGqdtJKy5A9
	31a8IhNhHIqw0Jc0hWt8T4om18hiBuddB9tKSUmpcrIc8gDUsVFnrcXQCmki50noOkw8J9sM5AR
	oB9SRxmI1wvzW9WNHe0vewfRCUrEWSK7vmg==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr3576586wml.127.1631017104502;
        Tue, 07 Sep 2021 05:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB9lpSYRjC+nwBj78YNN3ZDlBL5vpXCZ8sbbrL5Cjob2y7j5eoJJP5w2OFbtm4kDLZhWgyyA==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr3576575wml.127.1631017104347;
        Tue, 07 Sep 2021 05:18:24 -0700 (PDT)
Received: from kozik-lap.lan ([79.98.113.47])
        by smtp.gmail.com with ESMTPSA id m3sm13525216wrg.45.2021.09.07.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:18:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Mark Greer <mgreer@animalcreek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Tue,  7 Sep 2021 14:18:03 +0200
Message-Id: <20210907121816.37750-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
References: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: IJSMWHSQDHDFIK7474EVIN27XRN2DJDW
X-Message-ID-Hash: IJSMWHSQDHDFIK7474EVIN27XRN2DJDW
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 02/15] nfc: do not break pr_debug() call into separate lines
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IJSMWHSQDHDFIK7474EVIN27XRN2DJDW/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unneeded line break between pr_debug and arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/llc_shdlc.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 78b2ceb8ae6e..e90f70385813 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -201,8 +201,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc, int y_nr)
 			del_timer_sync(&shdlc->t2_timer);
 			shdlc->t2_active = false;
 
-			pr_debug
-			    ("All sent frames acked. Stopped T2(retransmit)\n");
+			pr_debug("All sent frames acked. Stopped T2(retransmit)\n");
 		}
 	} else {
 		skb = skb_peek(&shdlc->ack_pending_q);
@@ -211,8 +210,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc, int y_nr)
 			  msecs_to_jiffies(SHDLC_T2_VALUE_MS));
 		shdlc->t2_active = true;
 
-		pr_debug
-		    ("Start T2(retransmit) for remaining unacked sent frames\n");
+		pr_debug("Start T2(retransmit) for remaining unacked sent frames\n");
 	}
 }
 
@@ -518,12 +516,11 @@ static void llc_shdlc_handle_send_queue(struct llc_shdlc *shdlc)
 	unsigned long time_sent;
 
 	if (shdlc->send_q.qlen)
-		pr_debug
-		    ("sendQlen=%d ns=%d dnr=%d rnr=%s w_room=%d unackQlen=%d\n",
-		     shdlc->send_q.qlen, shdlc->ns, shdlc->dnr,
-		     shdlc->rnr == false ? "false" : "true",
-		     shdlc->w - llc_shdlc_w_used(shdlc->ns, shdlc->dnr),
-		     shdlc->ack_pending_q.qlen);
+		pr_debug("sendQlen=%d ns=%d dnr=%d rnr=%s w_room=%d unackQlen=%d\n",
+			 shdlc->send_q.qlen, shdlc->ns, shdlc->dnr,
+			 shdlc->rnr == false ? "false" : "true",
+			 shdlc->w - llc_shdlc_w_used(shdlc->ns, shdlc->dnr),
+			 shdlc->ack_pending_q.qlen);
 
 	while (shdlc->send_q.qlen && shdlc->ack_pending_q.qlen < shdlc->w &&
 	       (shdlc->rnr == false)) {
@@ -641,8 +638,7 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 		llc_shdlc_handle_send_queue(shdlc);
 
 		if (shdlc->t1_active && timer_pending(&shdlc->t1_timer) == 0) {
-			pr_debug
-			    ("Handle T1(send ack) elapsed (T1 now inactive)\n");
+			pr_debug("Handle T1(send ack) elapsed (T1 now inactive)\n");
 
 			shdlc->t1_active = false;
 			r = llc_shdlc_send_s_frame(shdlc, S_FRAME_RR,
@@ -652,8 +648,7 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 		}
 
 		if (shdlc->t2_active && timer_pending(&shdlc->t2_timer) == 0) {
-			pr_debug
-			    ("Handle T2(retransmit) elapsed (T2 inactive)\n");
+			pr_debug("Handle T2(retransmit) elapsed (T2 inactive)\n");
 
 			shdlc->t2_active = false;
 
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
