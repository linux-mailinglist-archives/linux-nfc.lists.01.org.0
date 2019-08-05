Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467F825B0
	for <lists+linux-nfc@lfdr.de>; Mon,  5 Aug 2019 21:40:40 +0200 (CEST)
Received: from [127.0.0.1] (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4A2F121314754;
	Mon,  5 Aug 2019 12:43:09 -0700 (PDT)
X-Original-To: linux-nfc@lists.01.org
Delivered-To: linux-nfc@lists.01.org
Received-SPF: Pass (sender SPF authorized) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=sedat.dilek@gmail.com; receiver=linux-nfc@lists.01.org 
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ml01.01.org (Postfix) with ESMTPS id B723C2131473D
 for <linux-nfc@lists.01.org>; Mon,  5 Aug 2019 12:43:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f17so74101428wme.2
 for <linux-nfc@lists.01.org>; Mon, 05 Aug 2019 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Wh68yPt+IQj+lLhA+0LBEh0DgFqyBXSzdTmMU5WM+DA=;
 b=EBUhF4oqXDInC/4YE0VTgmrP0drpFvRtAuSC6MUIi4YpN7EdiLueTbgLGUSMSYtFo7
 LJcc355Kle6J/1j3vmYAC2nk0eB1V5Wacc/saMfv9GRXuruSXssl8mstLpQRSn/DWlhD
 3hiZj3xHY23AJWQDCljmsIwrdDPGDgJqOa0l9UcHzRY5Pi4Mi6JTrsjI+lA6kFFQQce/
 P6jJOoNPay1HyRLFG0rBAARpYS2i7AeYXyIO2PI3h1tR0x5/F/8BNV5qKt4JwG65guf2
 UTKjXTmme8ZuwmlG/xsg4h9xmstUBZZg/P+1dWkpf0I12S4AmmW/Tyh2ioLdjNDZX+4a
 4QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Wh68yPt+IQj+lLhA+0LBEh0DgFqyBXSzdTmMU5WM+DA=;
 b=qRhE4nIDUwqS25Uu19aYDULzLDIss6yXkwPt4PkETnzP3WUWGZZZ8EoJBUctxRMOmD
 G94bMwfzPfSdqmhsWo+a6S55w/0z4N8P53ImDvew7nB+IlH2yXYPNm8+30RXp3+6vfs6
 00i4rXQnqelDDwp4jANXJC3+l7OwpISHkWJICb7BEevPMtPUy5gRpTRD2XSUlK6K9j9K
 H+q9naRdIwm4hI9XZ/lbJVodgadYNQeG3GrxBSmICyKjbl1XN3DifEXYjYN7wfBWq4nZ
 mQ34hkEaAWy4e264O+G1qRUuPDuujOs7c+WoczWqeub1bAplyoq3i3lvm6e3UrYK8e0M
 A42w==
X-Gm-Message-State: APjAAAUdU1JV3gQ1k9n+6mHv0COr+86yc9ZgXbbrSg2b9/0spquj6abV
 g6lj2NOLkq7nkHbLxSDgxoA2w4MgpGbHSG8L74BDOwUJSf4=
X-Google-Smtp-Source: APXvYqwkcw7UsqlP4Oea3mY4hew9pW5IetOrTlFz4xXYS/fMFW0vwxmKXJts0KBM3CO5TF03cN0K33ivFuZeLTVr72E=
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr28793wmb.150.1565034035841; 
 Mon, 05 Aug 2019 12:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <c2d0d19f-d814-8f41-4860-77b9cc7f9d26@linaro.org>
 <CA+icZUVz7sB6hv4fhL_rqhR_D8RePBJFXk1PaUy5tMw2z4xC_Q@mail.gmail.com>
 <5ae87449-83a1-ecce-c72c-b4742c507497@linaro.org>
 <CA+icZUXDLQKyTH-_pPi7A2=Bu5ratwab930Fcecrdr4NtMnFcw@mail.gmail.com>
 <27f2ce02-8deb-384f-af10-7737b703770a@linaro.org>
 <CA+icZUVaBdswfmRfbRtdVJY8ymeDOwDSFEf7G6jneqEmpW84bg@mail.gmail.com>
 <525160f3-a76c-4b45-2e05-c27aaabbf74d@linaro.org>
In-Reply-To: <525160f3-a76c-4b45-2e05-c27aaabbf74d@linaro.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 5 Aug 2019 21:40:24 +0200
Message-ID: <CA+icZUXfx2N_EOJG73bas78ernDeHfiByeiH1yOCb-HmgEnO-g@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [linux-nfc] NXP NFC version and ACPI
X-BeenThere: linux-nfc@lists.01.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: NFC on Linux <linux-nfc.lists.01.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nfc/>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nfc>,
 <mailto:linux-nfc-request@lists.01.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-nfc@lists.01.org, linux-wireless@vger.kernel.org,
 charles.gorand@effinnov.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-nfc-bounces@lists.01.org
Sender: "Linux-nfc" <linux-nfc-bounces@lists.01.org>

v4 of the patchset was included in net-next Git.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
_______________________________________________
Linux-nfc mailing list
Linux-nfc@lists.01.org
https://lists.01.org/mailman/listinfo/linux-nfc
