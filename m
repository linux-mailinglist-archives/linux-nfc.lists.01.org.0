Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02B4F1656
	for <lists+linux-nfc@lfdr.de>; Mon,  4 Apr 2022 15:45:13 +0200 (CEST)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 0BC62100EA910;
	Mon,  4 Apr 2022 06:45:11 -0700 (PDT)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 9147A100EB358
	for <linux-nfc@lists.01.org>; Mon,  4 Apr 2022 06:45:08 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x20so3277897edi.12
        for <linux-nfc@lists.01.org>; Mon, 04 Apr 2022 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ag4NtuXcd337V7EAqGGmB9o5JEXFbkeH+3FIqIGxGO0=;
        b=F0mJ7WcX4xs/jOWKodEod/6QWP7Ws2vdXT+KJwA3bipp69Y294eucyZJIPupeUKJ8N
         6Aq2+S80bx6u/ZqROwVieqoEL5yAoKEH0GMrrOc4VbJ9BcKW8Jlm02idcWjg1ImRzOjO
         bu38z/dqyZkTVu0lEJFBfXU6zPJWisFE+Rj1f4OhydFYaC40Ih+a1Q9WitQg/0+CTKmk
         Z2zFcgSVry7N1yP7lLhh0JOUzlHQkLPivo6PVGj2GbDIV88pXNWs4sa8Yq54kyIHdF3G
         mVquOW9lHC2ZyikW2VMY0M8K7F7859m/dHqLXvahTivFjkmaMXM3nusALXtOVmLfj7Ln
         k5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ag4NtuXcd337V7EAqGGmB9o5JEXFbkeH+3FIqIGxGO0=;
        b=qW6ZG1GpVV0ePGqbO/vNGxY/SI36H/XBcAX5peU38E06NeE3bV337LKjHMKrsAfy6K
         Fll7fbc3YrmfObd7IRVqfB5MEe6d7SkMgCgJqQBNbuv4Z8JcMoRXIlcrHJKZtpJGsGNA
         0G56hEL3aMYzpy3QaUjflGh0eKiN3+N2ZmBv6fWJXAeMrdWiOiI6NHZX6u3Tqegxp01x
         PWGQSVv9pM33xpsZtoHFR79mNlV9nJB6sZR7vAYSpDcSSZLam0fI5PMeny9lIKi1TpZW
         gAJdJv8fTAXX9fE03PsXlmTPVnWv08ot/XivyE/nO4Ru7UqFHyo5ctqsbulnEiKSB0m3
         EiJg==
X-Gm-Message-State: AOAM5310bIUP/1GkI4sSrMG6bF+oVl6LFBy7XssfafSA5QXPW54KVv4J
	OZGwXOKaWXlcQjUQLdQju+I0Xw==
X-Google-Smtp-Source: ABdhPJwys+HV9TUCHNVVEmCAx3DDsJ2cNjVstxGVCnIgM8Bc/ms4M+z4PvyJ39/sEk8Lu/e3YL4/Mg==
X-Received: by 2002:a05:6402:5201:b0:419:4c82:8f11 with SMTP id s1-20020a056402520100b004194c828f11mr77514edd.133.1649079905006;
        Mon, 04 Apr 2022 06:45:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfdfdac005sm4409273ejc.174.2022.04.04.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 06:45:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: netdev@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-nfc@lists.01.org
Date: Mon,  4 Apr 2022 15:45:02 +0200
Message-Id: <164907989905.809631.16161802401962719876.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
References: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Message-ID-Hash: 5OCTPOPC4AQPOKMZEIWQY4HVGLLDN6TG
X-Message-ID-Hash: 5OCTPOPC4AQPOKMZEIWQY4HVGLLDN6TG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/5OCTPOPC4AQPOKMZEIWQY4HVGLLDN6TG/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 30 Mar 2022 09:40:14 +0200, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Hi,
> 
> I can take both patches via my Samsung SoC tree, if that's ok.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: update Krzysztof Kozlowski's email
      commit: 8a1e6bb3f78f06432e095758476358d8cb63c03d
[2/2] MAINTAINERS: update Krzysztof Kozlowski's email to Linaro
      commit: 1a9f338f9cf96f8338d5592dee5fce222929e4f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
