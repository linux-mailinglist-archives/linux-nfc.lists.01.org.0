Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4555387A25
	for <lists+linux-nfc@lfdr.de>; Tue, 18 May 2021 15:40:03 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 35B3D100EBB9C;
	Tue, 18 May 2021 06:40:02 -0700 (PDT)
Received-SPF: Pass (helo) identity=helo; client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=stephan@gerhold.net; receiver=<UNKNOWN> 
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 63C2B100EBB72
	for <linux-nfc@lists.01.org>; Tue, 18 May 2021 06:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621345192; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LNo3e33Jwp/DUaMWUGF2+AqPjxexI2khm2MPog2GVv+qI7lHxv60ObBW1vpYY8GpoL
    0TwXFCGMlc1GFmu9EC1lQ7gBvCu6ObRZsi256D0LXf3PAN53rLh7yVXlaV8xoEilvHAN
    vp9uEcP2AugVOkFnD2cnYK0BsWibPaHGC2fvE1Yr31aPLA3wISVDEGVRikHvy9xRqL7Z
    qSL4qlfRigN4v1F4ar7MkIyS3lo7O8h47g+A+hY5uYdmD7ssYn7q9bmVwnw9+xxG18Uh
    nByL7H1RPmGmVyCohv1fzxIHQcrga2Bq0YZLFNCG0sGkJUOhKO0LkE0gXST7sNU/zI+G
    cLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621345192;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Y1KRDbu5WN3XFPdHGE3A1QrQ6q/NLxWm/b5TELJkolY=;
    b=rNG/seh7q8wSOqLsG87KzEkp180y5PqYra90vA3Gl8uXMhERDZPjakRKxV9Wo/GfnK
    vs0zPJ6sXixX0+O9in8RFlXtNNLD8yD+k4oK/FEEOXrgcVv0H01IErN5ySLQaYEEk4SO
    RXDp0d/xvnj714SrVp/3mHUVPQLeHCzSPYKAfnrwr996akE4q5UDhRi2OBx5DPGplHn7
    4Ny+1asV+uqmxrv27Ub09pL8I+8qCwyqdUHlygKBLHZF8bk7UGZLF/l4yuMOaNBKB5L4
    3GbJONprzX6w7cu8JJRPByHzZmZlf7EQRvPsd+HoEQTVgWzTr4BDOUmn70TD0BFAvOFL
    /cFA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621345192;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Y1KRDbu5WN3XFPdHGE3A1QrQ6q/NLxWm/b5TELJkolY=;
    b=iERjNiZS708Ahp81a9V91zZEQKq4ddOf32Bfg7NLiFzDVMBC6FgmfgllH05jiaDMz8
    fo7thxQ0Z4RhiBj6RGC9+fEZMID2r8A7Wtd2RvO0e7wjRUrmJjzyGFgN1GIXsVCljnmF
    x+hgMZ5LqeflrJjQrMnr+m9hN7LYDz8AAWlA24+YzZWxIZv9zq6WG8KFxr2WWni9whrz
    OuD3fy+9TX/fwdXDJZoQayaQ56b/FQwMZoedvyipKBGzQu42lH5UjgQVLk6nw8iO2b72
    2IqBaTz6wgqK3fR0XqLaTKQGg04i+3H0oiXV0Xr6wJ0RjF3C4Kj7S5b2gb0/v/faR1Gb
    7VCg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6NZHoD"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.26.1 DYNA|AUTH)
    with ESMTPSA id f01503x4IDdp2oJ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 18 May 2021 15:39:51 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Date: Tue, 18 May 2021 15:39:34 +0200
Message-Id: <20210518133935.571298-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Message-ID-Hash: 3Y3J5BGV2PC25TKTLU4QQUNUUEVBHW3X
X-Message-ID-Hash: 3Y3J5BGV2PC25TKTLU4QQUNUUEVBHW3X
X-MailFrom: stephan@gerhold.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>, linux-nfc@lists.01.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>, ~postmarketos/upstreaming@lists.sr.ht, Stephan Gerhold <stephan@gerhold.net>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH 1/2] dt-bindings: net: nfc: s3fwrn5: Add optional clock
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/3Y3J5BGV2PC25TKTLU4QQUNUUEVBHW3X/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On some systems, S3FWRN5 depends on having an external clock enabled
to function correctly. Allow declaring that clock (optionally) in the
device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
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
