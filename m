Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100E0388A5F
	for <lists+linux-nfc@lfdr.de>; Wed, 19 May 2021 11:19:23 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 91C4B100EAB5D;
	Wed, 19 May 2021 02:19:21 -0700 (PDT)
Received-SPF: Pass (helo) identity=helo; client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=stephan@gerhold.net; receiver=<UNKNOWN> 
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 181E1100EBB97
	for <linux-nfc@lists.01.org>; Wed, 19 May 2021 02:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621415951; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oKhH+3x37jVYwpsaTvYqbGwxbdMPM/QLgMWWWyUN+DR2KAYrBEQXumRPK+qXQcftTq
    LdYnUgvtt50SUwg8QYe+NF4h9tFPTTlEMcTif174zOZQkrtLHms/51wX6Kr7fFZ+62HB
    KOFkbhNT5wt3AfvIt4tZ1mHGMqmCEqJHDCrKn4nOwY9KgcxfyeqQLuywzxUEOGcNxdlC
    7cRK9y57adashICn9hQkaETqppAgiKXGuQTwY+RJVyb+8xC7EE5bW9/g/T7BvFEwoyed
    FJorbKPronOhbcUJN8+nRk1xi+E7WtVYr31kFouM3ufie3KSTtKCMgHsPfz/9dlADlIk
    MUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621415951;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Zbi+B4/e2Q+/ssyD7Vq4ySlcm/sXYI/o0fZdGdKqrgk=;
    b=W/niXT26d4Wa3wWWU04YNW5JKmQcfzY/1dt0PL15er7C26qLRxacQVsmu2el2PLAT+
    5iR4KkkNg+PQUwV0EnJdvtNcjsmRhBIFA20u6Q2N6Wo7AaPb/1DnDkfScqQOh2ERkkDH
    AqybytYQNf9xGvvpCWcUZUh4oEb6A7O4qjM93KnWtvuXYzVxD5+vaQWSAl8uVixAtBAm
    Wde5r0brz9mtVFX2fS1hos6ge0K5vnt5mvZThayjCDhF2povLCvgBi/fyRaoZFnmuWy4
    O9DJbZ1j435gfzBNbq3XOqBpUbfvpCbWypi64HefDM2BdW3GKQhmjbqyklFDSgpW2zDP
    EJRQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621415951;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Zbi+B4/e2Q+/ssyD7Vq4ySlcm/sXYI/o0fZdGdKqrgk=;
    b=g0P/DtWfPQbij3eOCD7iESCphhfTFk0DfcgzmYgW/yAz3JF4FjGf3q7KpSzTnptlbN
    Bp7bVv7fXF6BK4MYW68gCIhT4wncUI2dGplNRE45b5Um447zDxXekqtxkEvM9PwDmCjO
    xre3F0tfhIM9hGXp8L3RKH1o0X7npRUZFN5cTQomEs0PBkGSRxpfEuYCSWpCQZmtDZik
    oHsUNblHAleFar+qGl8czFWF8Jmgc/KhVeHKSxb0NQluNKGMtC/X8a5PF3Ov43qTWRh1
    OkVaCieMjGzUvz77XdlVuFWKqY9tFVi/5z3OxmNnurpDbe7gQniQXlU4eK/qxFdhL+vI
    d+jw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NfHcC"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.26.1 DYNA|AUTH)
    with ESMTPSA id z041eax4J9J95ai
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 19 May 2021 11:19:09 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 May 2021 11:16:12 +0200
Message-Id: <20210519091613.7343-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Message-ID-Hash: IVTVTTMZHJ5I7TUOMCCNNYCTAGCA4LFH
X-Message-ID-Hash: IVTVTTMZHJ5I7TUOMCCNNYCTAGCA4LFH
X-MailFrom: stephan@gerhold.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>, ~postmarketos/upstreaming@lists.sr.ht, Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 1/2] dt-bindings: net: nfc: s3fwrn5: Add optional clock
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/IVTVTTMZHJ5I7TUOMCCNNYCTAGCA4LFH/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On some systems, S3FWRN5 depends on having an external clock enabled
to function correctly. Allow declaring that clock in the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Minor change in commit message only
v1: https://lore.kernel.org/netdev/20210518133935.571298-1-stephan@gerhold.net/
---
 .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
index 477066e2b821..081742c2b726 100644
--- a/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
@@ -27,6 +27,9 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
   wake-gpios:
     maxItems: 1
     description:
@@ -80,6 +83,8 @@ examples:
 
             en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
             wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
+
+            clocks = <&rpmcc 20>;
         };
     };
   # UART example on Raspberry Pi
-- 
2.31.1
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
