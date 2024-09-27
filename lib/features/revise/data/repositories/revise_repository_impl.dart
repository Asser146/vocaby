import 'package:vocaby/features/revise/domain/repositories/revise_repository.dart';
import 'package:vocaby/features/revise/data/data_sources/revise_data_source.dart';



/// ReviseRepositoryImpl is the concrete implementation of the ReviseRepository
/// interface.
/// This class implements the methods defined in ReviseRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class ReviseRepositoryImpl implements ReviseRepository {
      
   final ReviseDataSource  reviseDataSource;
   ReviseRepositoryImpl(this.reviseDataSource);
}