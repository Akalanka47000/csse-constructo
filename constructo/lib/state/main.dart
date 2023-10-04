import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:constructo/state/ui/global/global_bloc.dart';
import 'package:constructo/state/ui/loader/loader_bloc.dart';

List<SingleChildWidget> rootBlocProviders = [
  BlocProvider(create: (context) {
    final bloc = GlobalBloc();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) => bloc.add(SetVersion(packageInfo.version)));
    return bloc;
  }),
  BlocProvider(create: (context) => LoaderBloc()),
  BlocProvider(create: (context) => RequisitionUIBloc()),
];