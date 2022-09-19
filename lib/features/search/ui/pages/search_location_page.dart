import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/app/resources/dimensions.dart';
import 'package:weather_app/app/resources/spacings.dart';
import 'package:weather_app/app/resources/strings.dart';
import 'package:weather_app/core/common/widgets/progress_view.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/extensions/string_extensions.dart';
import 'package:weather_app/features/search/ui/bloc/search_location_weather_bloc.dart';
import 'package:weather_app/features/weather/ui/widgets/current_weather_view.dart';

class SearchLocationPage extends StatelessWidget {
  const SearchLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchLocationWeatherBloc.fromContext(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.searchPageTitle),
        ),
        body: Padding(
          padding: Dimensions.mAllPadding,
          child: Column(
            children: [
              _SearchLocationField(),
              Spacings.xlSize,
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocBuilder<SearchLocationWeatherBloc, SearchLocationWeatherState>(
          builder: (
              BuildContext context,
              SearchLocationWeatherState state,
              ) {
            return state.maybeWhen(
              initial: () => _buildSearchHint(context),
              orElse: () => const SizedBox.shrink(),
              loading: () => const ProgressView(),
              weather: (WeatherInfoResponse weather) => CurrentWeatherView(weather),
            );
          },
        );
      },
    );
  }

  Widget _buildSearchHint(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.searchEngineDescription1,
          style: Theme.of(context).textTheme.headline6?.copyWith(color: ColorPalette.kTextColor),
        ),
        Spacings.mSize,
        Text(
          Strings.searchEngineDescription2,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorPalette.kTextColor),
        ),
        Spacings.sSize,
        Text(
          Strings.searchEngineDescription3,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorPalette.kTextColor),
        ),
      ],
    );
  }
}

class _SearchLocationField extends StatefulWidget {
  @override
  _SearchLocationFieldState createState() => _SearchLocationFieldState();
}

class _SearchLocationFieldState extends State<_SearchLocationField> {
  final TextEditingController _textEditingController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchLocationWeatherBloc, SearchLocationWeatherState>(
      listener: (BuildContext context, SearchLocationWeatherState state) {
        state.maybeWhen(
          failed: (Failure failure) {
            setState(() {
              _errorMessage = 'Not Found (${failure.getMessage().capitalize()})';
            });
          },
          weather: (_) {
            setState(() {
              _errorMessage = null;
            });
          },
          orElse: () {},
        );
      },
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          hintText: Strings.searchHintText,
          hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: ColorPalette.kTextColor.withOpacity(0.7)),
          errorText: _errorMessage,
          suffixIcon: _buildSuffixIcon(),
        ),
        onChanged: (String query) {
          context.read<SearchLocationWeatherBloc>().search(query);
        },
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        _textEditingController.clear();
        context.read<SearchLocationWeatherBloc>().reset();
      },
      icon: const Icon(Icons.clear),
    );
  }
}
