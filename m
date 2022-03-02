Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922E4CAEA3
	for <lists+linux-nfc@lfdr.de>; Wed,  2 Mar 2022 20:25:43 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7E390100F4848;
	Wed,  2 Mar 2022 11:25:39 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id CFFB4100EA925
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 11:25:37 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5DDC43F1D0
	for <linux-nfc@lists.01.org>; Wed,  2 Mar 2022 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646249136;
	bh=Mdsn7AT474MZc2MQVfRJDSMS8EOfClYXR9EYCiW/6uw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=AUCDt5MsPe1PsjaSbSqC0wKPst/OHiR1mFTDwZknPsfCfDn916ACo+WiDg3LUbhvx
	 dZd6/Pg+5i6ioIBg2Vmo0iSut117ANG+Bx5udlxo1Fw0w6W1mjq62wmXsYBLrTKZsD
	 z0eNI7a/NpueBLdcZpxghkvOAZWXkVAFUIG1F6hQMpGwMl3lyjNRgAVQJHk7/AHJnj
	 MOQGDbQZerf8yq2Zn55yQs0ZlhSFSBNHer/c9hTx7546G5clYCgRqQvb3O+8Q9xAzP
	 sE1fNHrkqFBVneq139nTcS3cBXLdX7/8fviz3fsarIn9NQf7MA2I8k7b1hcH9fnw9/
	 IIWibeZL7mW+w==
Received: by mail-ed1-f69.google.com with SMTP id i5-20020a056402054500b00415ce7443f4so576423edx.12
        for <linux-nfc@lists.01.org>; Wed, 02 Mar 2022 11:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mdsn7AT474MZc2MQVfRJDSMS8EOfClYXR9EYCiW/6uw=;
        b=m676da9QqgG23BXo3KAVyQiqGmSE5CI6NYp7EuC9PqR83TPN14+CAISKzmZfAnC+0t
         nT3y0uFde2ZUVnkMlEdl56MRwo8nCjPwRAAp/HhbXjf63d5pHDJ+eIlY7LPP2vxHTiyt
         g253Mg/eATveqvMiXuvtQ2niZFTnGUM1fI2fMpye9Do4G+ejmwikgjXAuYspWpzq+Hqu
         D5oUnVLB9KuYQUbWDrmlggNcEyqfIHvY52Rp0/u6aJe2EpEKEDM4W/mKYWaNmmd5Wyy7
         aLT8WCCKsASq3aSOMLQADnvVm/k51940VF/cqIE+6c26DwP6n/wYZuoO2+RjPV5KcHWj
         OglQ==
X-Gm-Message-State: AOAM5326du3wo4uaDqBQ+7n1HmWa9VGe/Dwo8cqedN8QEA7+x3HIZgs5
	f0iMjB6CDm1YXM1ypILPZoEbhJiWZ+AZXUIIkPr/lkfwGoq8CpIePVSv4FplJswmedvtkhbmLvH
	Rkmm1LWjYA2F/ox0mxb0LH9sVEz+j4LcDUw==
X-Received: by 2002:a17:906:714c:b0:6cf:4850:52cc with SMTP id z12-20020a170906714c00b006cf485052ccmr24550323ejj.319.1646249136077;
        Wed, 02 Mar 2022 11:25:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTh8qQiPVslsguc9Q0e99iiJ94AmhFY0BNCMiQLPiKFvI8B9dasw3D154XCQaRCiddESFGrA==
X-Received: by 2002:a17:906:714c:b0:6cf:4850:52cc with SMTP id z12-20020a170906714c00b006cf485052ccmr24550313ejj.319.1646249135910;
        Wed, 02 Mar 2022 11:25:35 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i14-20020a50cfce000000b00415b0730921sm1482765edk.42.2022.03.02.11.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 11:25:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed,  2 Mar 2022 20:25:23 +0100
Message-Id: <20220302192523.57444-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
References: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: PXJF3BI4SSG5VJLOBVL6BM6VGJJ5U5RD
X-Message-ID-Hash: PXJF3BI4SSG5VJLOBVL6BM6VGJJ5U5RD
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [RESEND PATCH v2 6/6] nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is actually sent"
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/PXJF3BI4SSG5VJLOBVL6BM6VGJJ5U5RD/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This reverts commit 17f7ae16aef1f58bc4af4c7a16b8778a91a30255.

The commit brought a new socket state LLCP_DISCONNECTING, which was
never set, only read, so socket could never set to such state.

Remove the dead code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp.h      | 1 -
 net/nfc/llcp_core.c | 7 -------
 net/nfc/llcp_sock.c | 7 -------
 3 files changed, 15 deletions(-)

diff --git a/net/nfc/llcp.h b/net/nfc/llcp.h
index d49d4bf2e37c..c1d9be636933 100644
--- a/net/nfc/llcp.h
+++ b/net/nfc/llcp.h
@@ -6,7 +6,6 @@
 enum llcp_state {
 	LLCP_CONNECTED = 1, /* wait_for_packet() wants that */
 	LLCP_CONNECTING,
-	LLCP_DISCONNECTING,
 	LLCP_CLOSED,
 	LLCP_BOUND,
 	LLCP_LISTEN,
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index b70d5042bf74..3364caabef8b 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -737,13 +737,6 @@ static void nfc_llcp_tx_work(struct work_struct *work)
 			print_hex_dump_debug("LLCP Tx: ", DUMP_PREFIX_OFFSET,
 					     16, 1, skb->data, skb->len, true);
 
-			if (ptype == LLCP_PDU_DISC && sk != NULL &&
-			    sk->sk_state == LLCP_DISCONNECTING) {
-				nfc_llcp_sock_unlink(&local->sockets, sk);
-				sock_orphan(sk);
-				sock_put(sk);
-			}
-
 			if (ptype == LLCP_PDU_I)
 				copy_skb = skb_copy(skb, GFP_ATOMIC);
 
diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5c5705f5028b..4ca35791c93b 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -641,13 +641,6 @@ static int llcp_sock_release(struct socket *sock)
 
 	release_sock(sk);
 
-	/* Keep this sock alive and therefore do not remove it from the sockets
-	 * list until the DISC PDU has been actually sent. Otherwise we would
-	 * reply with DM PDUs before sending the DISC one.
-	 */
-	if (sk->sk_state == LLCP_DISCONNECTING)
-		return err;
-
 out:
 	sock_orphan(sk);
 	sock_put(sk);
-- 
2.32.0
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
