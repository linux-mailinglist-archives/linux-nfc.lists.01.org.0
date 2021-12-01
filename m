Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B082B464A37
	for <lists+linux-nfc@lfdr.de>; Wed,  1 Dec 2021 09:56:56 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 1640D100F226B;
	Wed,  1 Dec 2021 00:56:55 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.188.122; helo=smtp-relay-internal-0.canonical.com; envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN> 
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id A849F100F225F
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 00:56:51 -0800 (PST)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 55DEE3F1B2
	for <linux-nfc@lists.01.org>; Wed,  1 Dec 2021 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1638349010;
	bh=lMW7ehrKREmtVZh3psMViZp5x7E8JGcgk06MJpBe6yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type;
	b=qJBtu7jH3mUfbqRByuHSbzQ5ePx3EcLrde235/72G9X7GPP6VJbbo4S0tdtI3MK7V
	 TkC7cgRaedaB2H8RaUor9EkVt0rg40yoW2i+tuOJIXZV9CQ9LuFWfWC+UfDLbGZgwn
	 vyXtpzx7tOHsKQrIL4CfHt6Jg15vyEm+x9y570NcQWZbDc4aNbb3aTS7iLtGkh20di
	 wmI/feCDhA8AwiXKt6vOoOFaLjIJYojDRwnPV4bV/WbJGsRbWFENogBryRSEb9csW6
	 aUYAydzX+ZS0y6uBwW9H99yWPQCm+4QRjZu1PQra8eUjuvUns8kqYHa++IO8Na0qdw
	 Z8T8A7UYLgPkw==
Received: by mail-lf1-f72.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbso9201804lfv.23
        for <linux-nfc@lists.01.org>; Wed, 01 Dec 2021 00:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lMW7ehrKREmtVZh3psMViZp5x7E8JGcgk06MJpBe6yE=;
        b=H3rvRFyeFPyJZlAzhE7O4PzhNgZ7DwFij27B0Oi5igQAhgACqWZp2zbCW0VHjmBf3Q
         NFxkEPGv2yF+yVvOtywHuEYpZK0jYnq2sNUuc2hieNiZ4KIeEl1JQoxtA28qxBxAkZ5p
         wjR2o5Z/AE56WhsQka9RkrHftlazOmyOH70vplNtRMLzl/R6I5DKbdUefpRrCamYDPw0
         aD9tDJYR3D8MLl5vhdjuzLMZFmsSeiesXijJrDm9e2VwXEH1tDA4uuTfr8U/p82Tb9/S
         wSGLQA58ezoVmijNlxvTSItkTQw2+B6UUQu9s9PTsY56Ea5tJXPIGdTSY1yAiJzIQ3jJ
         5VxQ==
X-Gm-Message-State: AOAM5336IxpudwCBZuut5SOrRlVVoiI+ETHUf1UA01avGUb1c6dz6JHo
	UZ6S+QRjCl579QgxR3bR1OL2P1hDWlDpBu0Zfb9PkO7nTP/mtA5xx6eQaI4wEbkMPmluLG+0wzh
	i1VF+9J486yvdla7hUSbb47pLnPg+NWgt9A==
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr4584813lfn.329.1638349009747;
        Wed, 01 Dec 2021 00:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCPB9A85s5uruA5t1xvRlxv2sBmLJ7WsZ/SIGehBuLnfAL/4AfUhfO2APDJT/t8lURFOf0ng==
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr4584791lfn.329.1638349009490;
        Wed, 01 Dec 2021 00:56:49 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k15sm2028848lfe.15.2021.12.01.00.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 00:56:49 -0800 (PST)
Message-ID: <b9b5b510-40d5-b945-61ba-a069e9847bf2@canonical.com>
Date: Wed, 1 Dec 2021 09:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Mark Greer <mgreer@animalcreek.com>, linux-nfc@lists.01.org
References: <20211129050606.873494-1-mgreer@animalcreek.com>
 <20211129050606.873494-2-mgreer@animalcreek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211129050606.873494-2-mgreer@animalcreek.com>
Message-ID-Hash: OJUO76F2776XS3SAHXHSWBZQSYVBONCQ
X-Message-ID-Hash: OJUO76F2776XS3SAHXHSWBZQSYVBONCQ
X-MailFrom: krzysztof.kozlowski@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 1/6] test: Use spaces for Python test scripts
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/OJUO76F2776XS3SAHXHSWBZQSYVBONCQ/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29/11/2021 06:06, Mark Greer wrote:
> The Python PEP 8 style guide prefers spaces over tabs so replace all
> tabs in the Python test scripts with spaces. See:
> 
> 	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Reformatting entire code is quite intrusive although useful. But while
reformatting - why not indenting it according to PEP 8 with four spaces?
Otherwise we will need second commit touching all the lines again.

> 
> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  test/bt-handover         | 192 ++++++++++++++++-----------------
>  test/handover-agent      | 208 ++++++++++++++++++------------------
>  test/monitor-near        |  50 ++++-----
>  test/ndef-agent          | 112 ++++++++++----------
>  test/neardutils.py       | 128 +++++++++++-----------
>  test/phdc-simple-manager | 154 +++++++++++++--------------
>  test/test-adapter        | 160 ++++++++++++++--------------
>  test/test-device         | 180 +++++++++++++++----------------
>  test/test-tag            | 224 +++++++++++++++++++--------------------
>  9 files changed, 704 insertions(+), 704 deletions(-)
> 
> diff --git a/test/bt-handover b/test/

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
