class RewardsProduct {
  String baseCurrency;
  double sitePrice;
  int productIdPk;
  String name;
  String productCode;
  String smallImageLink;
  String largeImageLink;
  String outletLink;
  int sortOrder;
  int shippingDays;
  int shippingCharges;
  int productVisible;
  int activeStatus;
  String productType;
  String category;
  String walletTypes;
  int newPoints;

  RewardsProduct({
    required this.baseCurrency,
    required this.sitePrice,
    required this.productIdPk,
    required this.name,
    required this.productCode,
    required this.smallImageLink,
    required this.largeImageLink,
    required this.outletLink,
    required this.sortOrder,
    required this.shippingDays,
    required this.shippingCharges,
    required this.productVisible,
    required this.activeStatus,
    required this.productType,
    required this.category,
    required this.walletTypes,
    required this.newPoints,
  });

  factory RewardsProduct.fromJson(Map<String, dynamic> json) {
    return RewardsProduct(
      baseCurrency: json['base_currency'] ?? '',
      sitePrice: json['site_price'] != null
          ? double.parse(json['site_price'].toString())
          : 0.0,
      productIdPk: json['product_id_pk'] ?? 0,
      name: json['name'] ?? '',
      productCode: json['product_code'] ?? '',
      smallImageLink: json['small_image_link'] ?? '',
      largeImageLink: json['large_image_link'] ?? '',
      outletLink: json['outlet_link'] ?? '',
      sortOrder: json['sort_order'] ?? 0,
      shippingDays: json['shipping_days'] ?? 0,
      shippingCharges: json['shipping_charges'] ?? 0,
      productVisible: json['product_visible'] ?? 0,
      activeStatus: json['active_status'] ?? 0,
      productType: json['product_type'] ?? '',
      category: json['p_category_name'] ?? '',
      walletTypes: json['wallet_types'] ?? '',
      newPoints: json['new_points'] ?? 0,
    );
  }
}
