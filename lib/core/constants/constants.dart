enum Flavor { dev, staging, prod }

class Constants {
  static late Map<String, dynamic> _config;

  Constants._();

  static void setEnvironmentVariables(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        _config = _Config.devConstants;
        break;
      case Flavor.prod:
        _config = _Config.prodConstants;
        break;
      case Flavor.staging:
        _config = _Config.stagingConstants;
        break;
    }
  }

//
  static get baseUrl {
    return _config[_Config.baseUrl];
  }

  static const themeMode = "shapshap_theme_mode";
  static const firstTimeUserKey = "first_time_user_key";
  static const paystackApiKey =
      "sk_test_9e498a3e835b2403bf152afe55fbee89c6f2c3d1";
  static const suportedCountries = ["NG"];
}

/// Allows this class to be only visible to this file*/
///
class _Config {
  static const baseUrl = "BASE_URL";
  static const buildGradient = "BUILD_GRADIENT";
  static const flavor = "ENV";

  static Map<String, dynamic> stagingConstants = {
    baseUrl: "https://finix.hmxexpress.com/api",
    buildGradient: "staging",
    flavor: Flavor.staging
  };
  static Map<String, dynamic> devConstants = {
    baseUrl: "https://finix.hmxexpress.com/api",
    buildGradient: "dev",
    flavor: Flavor.dev
  };

  static Map<String, dynamic> prodConstants = {
    baseUrl: "https://finix.hmxexpress.com/api",
    buildGradient: "production",
    flavor: Flavor.prod
  };
}
