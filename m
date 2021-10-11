Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E50634287CC
	for <lists+linux-nfc@lfdr.de>; Mon, 11 Oct 2021 09:39:55 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 7A482100EAB0D;
	Mon, 11 Oct 2021 00:39:53 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 1A869100EAB09
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:50 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7EEFD40024
	for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633937988;
	bh=UgKOyYZwudZNcbOmLjHV2oxljhkCMf/FkAv9xZY25jk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=VcX+7spCnd6U+Ae1SvJ6nByzv9umNK0MFTJqQhyyT6zUPS34NIgD/5QFP02Pz3YSz
	 S9X/6sy8vogjKrIYEzC0w847WiYaJJ0ak9Zv69EygZTSAjTE6F1h7HHwzsJhcImej9
	 srYnfkUyZe9RajA0QNQW2rE3NSzdZ8TuxX/YZ5rgbpjpNyO7KQ6LauPo4ClpriR6fx
	 Ip+v9mF6anCXRxVOptLhOU4HHXLeYUv8P9gdUD5SkA/w8EYLZCEF4cfYeShmTW13lQ
	 /cKHZzjpE1AcSraO53f5zCTSA0Byxv1akTDS5Sv6guGY+hD9mzJFWAf1ydOuiiJcS8
	 vWgCiMYAgmlKg==
Received: by mail-ed1-f72.google.com with SMTP id z23-20020aa7cf97000000b003db7be405e1so4174406edx.13
        for <linux-nfc@lists.01.org>; Mon, 11 Oct 2021 00:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UgKOyYZwudZNcbOmLjHV2oxljhkCMf/FkAv9xZY25jk=;
        b=3itiqswq3/LUkx7AVg2D2pXXW+fYY0wbqOqadyJ5GkCv9pt1KpZBFW/HBVtJLuNLq7
         MaaKMwpCsTABIZpVS984fg6yU5/PPUMzUSn2VYi80Q2BRag/PPtRfHq5s/TQuVEfLP6d
         r9JbD0YFK3Pt26YvPpp+K+EzwfTj2MSmAkujQZo59nX7qzpeJQ29sSWxoiCY5AJyeQrI
         Z8qcMc4ZgMtNw9pkfZZaeRrJmq3r7DxoI+yIonkmRR9nsTwiybTfBWzB7T3wlcyxzEHc
         2vS3967DnCoqEteG3QfFBB8RCht9nqO9s6Gg/oKGSRGwuBowCE8RJRL3RlhL4VqaaEnw
         /taA==
X-Gm-Message-State: AOAM531hJa9PF8OEvb+JcfVC1pfayZVCLq+5RX/EvR9JzdDuuZT02Iz2
	pppnorwos4aUzdOAQApRhiK+k8/QXNwTC0S3ptiAmmgIf+/x8uCfu4takgdbyq5QvQHAVGpxuFF
	v69wMRbiUyupwieEvWIbSngQm7FAK/Dwjhg==
X-Received: by 2002:a05:6402:90b:: with SMTP id g11mr285855edz.32.1633937987495;
        Mon, 11 Oct 2021 00:39:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpldaLH9a88wXudeyQvv2eytBFPukbJ2BYMZlSB5t8tpzJmcsqoMhbsiBWxgjJeaELLuFqBA==
X-Received: by 2002:a05:6402:90b:: with SMTP id g11mr285836edz.32.1633937987365;
        Mon, 11 Oct 2021 00:39:47 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y8sm3023965ejm.104.2021.10.11.00.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:39:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Mark Greer <mgreer@animalcreek.com>,
	linux-nfc@lists.01.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Date: Mon, 11 Oct 2021 09:39:28 +0200
Message-Id: <20211011073934.34340-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
References: <20211011073934.34340-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Message-ID-Hash: 7DGXTPT7XTDOFIDT77PMV6XJJVQNEXCS
X-Message-ID-Hash: 7DGXTPT7XTDOFIDT77PMV6XJJVQNEXCS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [PATCH v2 2/8] dt-bindings: nfc: nxp,nci: document NXP PN547 binding
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/7DGXTPT7XTDOFIDT77PMV6XJJVQNEXCS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

NXP PN547 NFC controller seems to be compatible with the NXP NCI and
there already DTS files using two compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
index 70634d20d4d7..7465aea2e1c0 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -12,7 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    const: nxp,nxp-nci-i2c
+    oneOf:
+      - const: nxp,nxp-nci-i2c
+      - items:
+          - const: nxp,pn547
+          - const: nxp,nxp-nci-i2c
 
   enable-gpios:
     description: Output GPIO pin used for enabling/disabling the controller
-- 
2.30.2
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
