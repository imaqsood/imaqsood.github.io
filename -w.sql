INSERT INTO
    aws_monthly (
        BillingAccountId,
        BillingAccountName,
        BillingCurrency,
        BillingPeriodEnd,
        BillingPeriodStart,
        ChargeCategory,
        InvoiceIssuerName,
        ProviderName,
        PublisherName,
        RegionId,
        RegionName,
        ResourceId,
        ResourceName,
        ResourceType,
        ServiceCategory,
        ServiceName,
        SubAccountId,
        SubAccountName,
        EffectiveCost,
        BilledCost,
        ChargePeriodStart,
        ChargePeriodEnd,
        ProcessDate,
    )
SELECT
    BillingAccountId,
    BillingAccountName,
    BillingCurrency,
    BillingPeriodEnd,
    BillingPeriodStart,
    ChargeCategory,
    InvoiceIssuerName,
    ProviderName,
    PublisherName,
    RegionId,
    RegionName,
    ResourceId,
    ResourceName,
    ResourceType,
    ServiceCategory,
    ServiceName,
    SubAccountId,
    SubAccountName,
    SUM(EffectiveCost) AS EffectiveCost,
    SUM(BilledCost) AS BilledCost,
    toStartOfMonth(ChargePeriodStart) AS ChargePeriodStart,
    MAX(ChargePeriodEnd) AS ChargePeriodEnd,
    2025 -01 -01 AS ProcessDate
FROM
    aws_hourly
WHERE
    ChargePeriodStart BETWEEN '2024-12-01'
    AND '2024-12-31'
GROUP BY
    BillingAccountId,
    BillingAccountName,
    BillingCurrency,
    BillingPeriodEnd,
    BillingPeriodStart,
    ChargeCategory,
    InvoiceIssuerName,
    ProviderName,
    PublisherName,
    RegionId,
    RegionName,
    ResourceId,
    ResourceName,
    ResourceType,
    ServiceCategory,
    ServiceName,
    SubAccountId,
    SubAccountName,
    ChargePeriodStart;



            INSERT INTO aws_monthly (
          BillingAccountId, BillingAccountName, BillingCurrency, BillingPeriodEnd, BillingPeriodStart, ChargeCategory, InvoiceIssuerName, ProviderName, PublisherName, RegionId, RegionName, ResourceId, ResourceName, ResourceType, ServiceCategory, ServiceName, SubAccountId, SubAccountName,
          EffectiveCost, BilledCost,
          ChargePeriodStart,
          ChargePeriodEnd,
          ProcessDate,
        )
        SELECT
            BillingAccountId, BillingAccountName, BillingCurrency, BillingPeriodEnd, BillingPeriodStart, ChargeCategory, InvoiceIssuerName, ProviderName, PublisherName, RegionId, RegionName, ResourceId, ResourceName, ResourceType, ServiceCategory, ServiceName, SubAccountId, SubAccountName,
            SUM(EffectiveCost) AS EffectiveCost, SUM(BilledCost) AS BilledCost,
            toStartOfMonth(ChargePeriodStart) AS ChargePeriodStart,
            MAX(ChargePeriodEnd) AS ChargePeriodEnd,
            toDate('2025-01-01') AS ProcessDate
        FROM aws_hourly
        WHERE ChargePeriodStart BETWEEN '2024-12-01' AND '2024-12-31'
        GROUP BY BillingAccountId, BillingAccountName, BillingCurrency, BillingPeriodEnd, BillingPeriodStart, ChargeCategory, InvoiceIssuerName, ProviderName, PublisherName, RegionId, RegionName, ResourceId, ResourceName, ResourceType, ServiceCategory, ServiceName, SubAccountId, SubAccountName, ChargePeriodStart;
