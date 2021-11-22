Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2262F458F51
	for <lists+linux-nfc@lfdr.de>; Mon, 22 Nov 2021 14:24:15 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 5C286100EA2A0;
	Mon, 22 Nov 2021 05:24:12 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 92DB1100EA93A
	for <linux-nfc@lists.01.org>; Mon, 22 Nov 2021 05:24:09 -0800 (PST)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1CB340009
	for <linux-nfc@lists.01.org>; Mon, 22 Nov 2021 13:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637587442;
	bh=R1e0f4ZmYqIeFljQRfPsZaAn1D7W7TwEAn+K9ViDCQ4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type;
	b=o54q6cwaq3SCV9uPb4ySDAxLHTvM6pxc8cIXCgBCfnXcFik2dBkeMj1reXieBsFl3
	 Fe8LebgFiVOYLtOXrwNnu8J8IP4tDblqAEvVlRAFPVr+5oqmiJZjoaNdXAsjmFICkS
	 QPO2E8s+HRRvB6gdnL06Efg6v8NfIOgLQ+8sLeGULyuYrDRJSf7GmlmX4cp2wbIWs9
	 dSSSA6owgQudmhq/qq+piDQfRm3KTcm46AWD6Hf1IMuCzKs5cR+9UIXKy/QjltTOyX
	 rK3nR9p79060TNVgjTRiBFO+ULvrU/SIqoKYU7w5Z/oNjpcXSFtzAeBrlnDKr2We3D
	 INEsJjw7CnY6w==
Received: by mail-lf1-f71.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso12233550lfv.7
        for <linux-nfc@lists.01.org>; Mon, 22 Nov 2021 05:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=R1e0f4ZmYqIeFljQRfPsZaAn1D7W7TwEAn+K9ViDCQ4=;
        b=rnmLLaXKhsuTjjFcwEJyambodtMek/1QwpWgAjlSvOFXNZgzFIwfw9HmGIWVhDBapx
         /gaYGSVly7WPIPxOYgcWvm8i3yJ4PI7y3YjChe11U3aLVZL8KgJVo6Rb5+8fcZaPnsf4
         j98wL4LzOgTjloda53vvJhGJDXf/QQQ9sLmwRUo8h4RAwCd02912PBI3+oyqew1zRRJ1
         6hfeWv0DL5qd0oC8xgJaPWZgGDTfTEizKTLQCciceMQVQjuJt+RFEXPwieTiNrUvctUy
         wxIJ4E3qOC5h9uZ1nJWi2XZ3TX9OxPorNRd0WoBojvLJOISLu4cdefdaMgNQfpN8f1Uu
         nquQ==
X-Gm-Message-State: AOAM531Bk1V/I0tBdltds2agRGNWmXP5IM9dzRnky0p713UV0qBKlYst
	punogN87LTb17ndVPQeqq0bbH3wbj3SZDRrAacWlL0QL/l7iQCt+4aD256bZyTnaZIfV1eHP6ux
	esHhPk5V13IFshXA14Jrz/9UizYGK9HM78w==
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr54903654lfk.408.1637587442184;
        Mon, 22 Nov 2021 05:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZiDvhC66h2OM7vtzyckt8Mrs9a0bz5CbaBmfctj0PlxgiNB/52HyygYddXdzYclcZIZT+tw==
X-Received: by 2002:ac2:4c55:: with SMTP id o21mr54903600lfk.408.1637587441773;
        Mon, 22 Nov 2021 05:24:01 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w6sm953550ljj.118.2021.11.22.05.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 05:24:01 -0800 (PST)
Message-ID: <c2a668ef-6395-f056-6f39-e909e6b370a7@canonical.com>
Date: Mon, 22 Nov 2021 14:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, aur-general@lists.archlinux.org,
 devel@lists.fedoraproject.org, packaging@lists.opensuse.org
Content-Language: en-US
Message-ID-Hash: NKL6257FUDB64OCAVZNBTDCLGWY3NQWS
X-Message-ID-Hash: NKL6257FUDB64OCAVZNBTDCLGWY3NQWS
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: Krzysztof Kozlowski <krzk@kernel.org>, Cody P Schafer <dev@codyps.com>, Dirk Mueller <dmueller@suse.com>, kokakiwi@kokakiwi.net, Peter Robinson <pbrobinson@fedoraproject.org>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] [neard] neard release v0.18
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/NKL6257FUDB64OCAVZNBTDCLGWY3NQWS/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

v0.18
=====
This is announce of new release of neard, an user-space counterpart of
Linux kernel NFC stack, v0.18.

I am sending this email to few distro lists and folks involved in
packaging neard (and updating existing packages). Please let me know if
I should skip notifying you or you think I should Cc someone else.

The release includes few fixes.

Source code release:
https://git.kernel.org/pub/scm/network/nfc/neard.git/tag/?h=v0.18
https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.18.tar.gz


Packaging updates
=================
With previous release v0.17, build requires autoconf-archive. I saw
Fedora and Arch already updated their packaging to include it. No
further changes here. The full list is:
https://github.com/linux-nfc/neard/blob/master/HACKING#L5


Bugs/comments
=============
1. linux-nfc@lists.01.org
2. https://github.com/linux-nfc/neard (as GitHub issues)


Few notes on new names and maintainers
======================================
The neard package was previously maintained Samuel Ortiz and Marcel
Holtmann, which were also main contributors. Last years Mark Greer was
looking after neard. I joined in 2021, both as a maintainer of Linux
kernel NFC stack and the neard.

Under GitHub I set up also Continuous Integration:
https://github.com/linux-nfc/neard/actions

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
